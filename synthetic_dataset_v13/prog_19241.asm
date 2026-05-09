; DESCRIPTION: Composite: Places a green line segment connecting (107, 200) to (206, 41) then Draws a yellow rectangle at (426, 52) with width 42 and height 107.
; PLAN: r0=107(x1), r1=200(y1), r2=206(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=52(y), r7=42(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 200
LDI r2, 206
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 52
LDI r7, 42
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
