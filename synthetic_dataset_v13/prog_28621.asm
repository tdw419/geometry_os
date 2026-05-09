; DESCRIPTION: Composite: Places a red circle of radius 43 at center (130, 136) then Places a magenta line segment connecting (283, 180) to (377, 94) then Places a white dot at position (221, 187).
; PLAN: r0=130(x), r1=136(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=180(y1), r7=377(x2), r8=94(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=187(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 136
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 180
LDI r7, 377
LDI r8, 94
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 187
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
