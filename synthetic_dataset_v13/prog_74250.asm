; DESCRIPTION: Composite: Places a black line segment connecting (57, 34) to (458, 106) then Places a blue 27x20 rectangle at position (27, 49) then Draws a cyan circle centered at (329, 179) with radius 39.
; PLAN: r0=57(x1), r1=34(y1), r2=458(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=49(y), r7=27(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=179(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 34
LDI r2, 458
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 49
LDI r7, 27
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 179
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
