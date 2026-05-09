; DESCRIPTION: Composite: Places a red circle of radius 63 at center (75, 161) then Sets a single yellow pixel at (246, 57) then Draws a blue rectangle at (357, 231) with width 18 and height 12.
; PLAN: r0=75(x), r1=161(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=57(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=357(x), r11=231(y), r12=18(width), r13=12(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 161
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 57
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 357
LDI r11, 231
LDI r12, 18
LDI r13, 12
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
