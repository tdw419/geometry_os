; DESCRIPTION: Composite: Places a red 84x40 rectangle at position (343, 176) then Places a magenta line segment connecting (78, 18) to (447, 37).
; PLAN: r0=343(x), r1=176(y), r2=84(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=18(y1), r7=447(x2), r8=37(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 176
LDI r2, 84
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 18
LDI r7, 447
LDI r8, 37
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
