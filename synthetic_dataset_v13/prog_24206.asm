; DESCRIPTION: Composite: Places a magenta 89x64 rectangle at position (193, 170) then Places a yellow line segment connecting (78, 206) to (265, 2).
; PLAN: r0=193(x), r1=170(y), r2=89(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=206(y1), r7=265(x2), r8=2(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 170
LDI r2, 89
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 206
LDI r7, 265
LDI r8, 2
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
