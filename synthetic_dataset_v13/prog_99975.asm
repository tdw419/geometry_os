; DESCRIPTION: Composite: Draws a green rectangle at (28, 36) with width 91 and height 13 then Draws a white line from (467, 148) to (366, 229).
; PLAN: r0=28(x), r1=36(y), r2=91(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=148(y1), r7=366(x2), r8=229(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 36
LDI r2, 91
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 148
LDI r7, 366
LDI r8, 229
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
