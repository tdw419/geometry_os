; DESCRIPTION: Composite: Renders a orange line between points (90, 197) and (144, 168) then Draws a purple rectangle at (457, 122) with width 39 and height 47.
; PLAN: r0=90(x1), r1=197(y1), r2=144(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=122(y), r7=39(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 197
LDI r2, 144
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 122
LDI r7, 39
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
