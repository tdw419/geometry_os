; DESCRIPTION: Composite: Places a white line segment connecting (505, 156) to (78, 33) then Places a black 62x83 rectangle at position (94, 19).
; PLAN: r0=505(x1), r1=156(y1), r2=78(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=19(y), r7=62(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 156
LDI r2, 78
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 19
LDI r7, 62
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
