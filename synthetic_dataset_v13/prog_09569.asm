; DESCRIPTION: Composite: Renders a red line between points (393, 121) and (368, 80) then Renders a blue disk with center (268, 69) and radius 68 then Sets a single blue pixel at (146, 88).
; PLAN: r0=393(x1), r1=121(y1), r2=368(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=69(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=88(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 121
LDI r2, 368
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 69
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 88
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
