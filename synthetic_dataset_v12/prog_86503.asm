; DESCRIPTION: Composite: Sets a single black pixel at (225, 155) then Renders a magenta box of size 88x82 starting at (214, 67) then Draws a green line from (176, 52) to (312, 25).
; PLAN: r0=225(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=67(y), r7=88(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x1), r11=52(y1), r12=312(x2), r13=25(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 67
LDI r7, 88
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 52
LDI r12, 312
LDI r13, 25
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
