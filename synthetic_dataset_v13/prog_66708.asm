; DESCRIPTION: Composite: Renders a purple line between points (228, 214) and (22, 134) then Draws a red rectangle at (44, 67) with width 90 and height 105.
; PLAN: r0=228(x1), r1=214(y1), r2=22(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=67(y), r7=90(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 214
LDI r2, 22
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 67
LDI r7, 90
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
