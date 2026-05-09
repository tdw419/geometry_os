; DESCRIPTION: Composite: Draws a yellow rectangle at (151, 86) with width 18 and height 98 then Renders a magenta line between points (507, 136) and (236, 176).
; PLAN: r0=151(x), r1=86(y), r2=18(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=136(y1), r7=236(x2), r8=176(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 86
LDI r2, 18
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 136
LDI r7, 236
LDI r8, 176
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
