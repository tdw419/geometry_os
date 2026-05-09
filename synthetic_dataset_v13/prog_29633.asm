; DESCRIPTION: Composite: Renders a yellow box of size 109x120 starting at (291, 23) then Places a green line segment connecting (463, 119) to (158, 235).
; PLAN: r0=291(x), r1=23(y), r2=109(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=119(y1), r7=158(x2), r8=235(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 23
LDI r2, 109
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 119
LDI r7, 158
LDI r8, 235
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
