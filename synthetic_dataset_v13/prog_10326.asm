; DESCRIPTION: Composite: Sets a single black pixel at (125, 21) then Creates a blue circular shape at (271, 161) with radius 14 then Renders a blue line between points (181, 9) and (192, 215).
; PLAN: r0=125(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=161(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x1), r11=9(y1), r12=192(x2), r13=215(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 271
LDI r6, 161
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 9
LDI r12, 192
LDI r13, 215
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
