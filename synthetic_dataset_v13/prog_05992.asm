; DESCRIPTION: Composite: Draws a magenta line from (371, 36) to (496, 29) then Renders a black box of size 16x105 starting at (216, 5).
; PLAN: r0=371(x1), r1=36(y1), r2=496(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=5(y), r7=16(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 36
LDI r2, 496
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 5
LDI r7, 16
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
