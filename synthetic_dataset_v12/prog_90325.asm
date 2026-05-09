; DESCRIPTION: Composite: Renders a black box of size 108x67 starting at (252, 1) then Places a magenta line segment connecting (187, 249) to (86, 74).
; PLAN: r0=252(x), r1=1(y), r2=108(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x1), r6=249(y1), r7=86(x2), r8=74(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 1
LDI r2, 108
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 249
LDI r7, 86
LDI r8, 74
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
