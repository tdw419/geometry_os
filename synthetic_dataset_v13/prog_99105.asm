; DESCRIPTION: Composite: Renders a purple line between points (73, 142) and (505, 170) then Draws a red rectangle at (210, 193) with width 67 and height 48.
; PLAN: r0=73(x1), r1=142(y1), r2=505(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=193(y), r7=67(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 142
LDI r2, 505
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 193
LDI r7, 67
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
