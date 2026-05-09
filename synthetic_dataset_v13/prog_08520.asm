; DESCRIPTION: Composite: Draws a blue circle centered at (212, 157) with radius 53 then Renders a orange box of size 97x59 starting at (68, 117) then Draws a orange line from (247, 168) to (237, 108).
; PLAN: r0=212(x), r1=157(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=117(y), r7=97(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x1), r11=168(y1), r12=237(x2), r13=108(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 157
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 117
LDI r7, 97
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 168
LDI r12, 237
LDI r13, 108
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
