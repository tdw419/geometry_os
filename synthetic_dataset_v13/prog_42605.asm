; DESCRIPTION: Composite: Draws a yellow rectangle at (262, 207) with width 65 and height 21 then Draws a cyan line from (357, 75) to (214, 232) then Draws a magenta circle centered at (385, 177) with radius 76.
; PLAN: r0=262(x), r1=207(y), r2=65(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x1), r6=75(y1), r7=214(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=177(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 207
LDI r2, 65
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 75
LDI r7, 214
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 177
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
