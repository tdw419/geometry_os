; DESCRIPTION: Composite: Places a green line segment connecting (168, 144) to (109, 187) then Draws a orange rectangle at (323, 192) with width 31 and height 48.
; PLAN: r0=168(x1), r1=144(y1), r2=109(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=192(y), r7=31(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 144
LDI r2, 109
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 192
LDI r7, 31
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
