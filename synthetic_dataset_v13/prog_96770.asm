; DESCRIPTION: Composite: Renders a green box of size 113x108 starting at (130, 23) then Draws a yellow line from (7, 234) to (295, 247) then Places a magenta circle of radius 43 at center (390, 125).
; PLAN: r0=130(x), r1=23(y), r2=113(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=234(y1), r7=295(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=125(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 23
LDI r2, 113
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 234
LDI r7, 295
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 125
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
