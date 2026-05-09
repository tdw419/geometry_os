; DESCRIPTION: Composite: Places a blue circle of radius 28 at center (35, 106) then Draws a blue line from (386, 186) to (397, 166) then Renders a orange box of size 36x31 starting at (409, 56).
; PLAN: r0=35(x), r1=106(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=186(y1), r7=397(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=56(y), r12=36(width), r13=31(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 106
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 186
LDI r7, 397
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 56
LDI r12, 36
LDI r13, 31
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
