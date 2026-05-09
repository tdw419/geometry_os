; DESCRIPTION: Composite: Places a blue line segment connecting (76, 245) to (78, 168) then Draws a black rectangle at (208, 42) with width 98 and height 98.
; PLAN: r0=76(x1), r1=245(y1), r2=78(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=42(y), r7=98(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 245
LDI r2, 78
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 42
LDI r7, 98
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
