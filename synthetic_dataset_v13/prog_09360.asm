; DESCRIPTION: Composite: Renders a green box of size 67x93 starting at (182, 50) then Draws a white line from (424, 23) to (147, 158).
; PLAN: r0=182(x), r1=50(y), r2=67(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x1), r6=23(y1), r7=147(x2), r8=158(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 50
LDI r2, 67
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 23
LDI r7, 147
LDI r8, 158
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
