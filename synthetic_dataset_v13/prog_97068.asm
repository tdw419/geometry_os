; DESCRIPTION: Composite: Places a magenta dot at position (340, 71) then Places a red line segment connecting (260, 175) to (301, 71) then Places a white circle of radius 54 at center (442, 87).
; PLAN: r0=340(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=175(y1), r7=301(x2), r8=71(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=87(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 340
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 175
LDI r7, 301
LDI r8, 71
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 87
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
