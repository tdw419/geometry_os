; DESCRIPTION: Composite: Places a green circle of radius 52 at center (285, 156) then Places a blue 45x100 rectangle at position (333, 91) then Places a cyan line segment connecting (54, 235) to (413, 139).
; PLAN: r0=285(x), r1=156(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=91(y), r7=45(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=235(y1), r12=413(x2), r13=139(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 156
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 91
LDI r7, 45
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 235
LDI r12, 413
LDI r13, 139
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
