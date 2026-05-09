; DESCRIPTION: Composite: Sets a single purple pixel at (130, 177) then Renders a blue disk with center (165, 164) and radius 51 then Renders a blue line between points (218, 61) and (303, 255).
; PLAN: r0=130(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=164(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x1), r11=61(y1), r12=303(x2), r13=255(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 164
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 61
LDI r12, 303
LDI r13, 255
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
