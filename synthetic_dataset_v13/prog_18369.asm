; DESCRIPTION: Composite: Places a magenta line segment connecting (467, 197) to (437, 70) then Renders a green box of size 36x37 starting at (334, 88).
; PLAN: r0=467(x1), r1=197(y1), r2=437(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=88(y), r7=36(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 197
LDI r2, 437
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 88
LDI r7, 36
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
