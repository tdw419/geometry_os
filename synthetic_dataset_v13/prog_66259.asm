; DESCRIPTION: Composite: Places a red dot at position (63, 254) then Renders a red box of size 56x85 starting at (202, 158) then Places a magenta line segment connecting (128, 67) to (71, 69).
; PLAN: r0=63(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=158(y), r7=56(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x1), r11=67(y1), r12=71(x2), r13=69(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 158
LDI r7, 56
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 67
LDI r12, 71
LDI r13, 69
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
