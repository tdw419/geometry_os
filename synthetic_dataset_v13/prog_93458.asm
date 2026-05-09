; DESCRIPTION: Composite: Draws a green line from (178, 236) to (82, 16) then Creates a magenta rectangular region at (214, 127) spanning 13 by 37 pixels then Creates a orange circular shape at (386, 181) with radius 65.
; PLAN: r0=178(x1), r1=236(y1), r2=82(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=127(y), r7=13(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=181(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 236
LDI r2, 82
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 127
LDI r7, 13
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 181
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
