; DESCRIPTION: Composite: Renders a green box of size 77x20 starting at (337, 143) then Places a yellow line segment connecting (256, 80) to (315, 138) then Sets a single blue pixel at (370, 185).
; PLAN: r0=337(x), r1=143(y), r2=77(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=80(y1), r7=315(x2), r8=138(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=185(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 143
LDI r2, 77
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 80
LDI r7, 315
LDI r8, 138
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 185
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
