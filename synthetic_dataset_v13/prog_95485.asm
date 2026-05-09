; DESCRIPTION: Composite: Renders a blue box of size 56x30 starting at (332, 205) then Draws a magenta line from (67, 140) to (87, 162).
; PLAN: r0=332(x), r1=205(y), r2=56(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x1), r6=140(y1), r7=87(x2), r8=162(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 205
LDI r2, 56
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 140
LDI r7, 87
LDI r8, 162
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
