; DESCRIPTION: Composite: Sets a single black pixel at (498, 162) then Renders a green disk with center (172, 142) and radius 57 then Renders a blue line between points (330, 146) and (445, 52).
; PLAN: r0=498(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=142(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x1), r11=146(y1), r12=445(x2), r13=52(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 172
LDI r6, 142
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 146
LDI r12, 445
LDI r13, 52
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
