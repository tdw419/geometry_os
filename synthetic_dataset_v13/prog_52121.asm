; DESCRIPTION: Composite: Creates a green rectangular region at (162, 58) spanning 65 by 91 pixels then Places a green dot at position (126, 79) then Draws a magenta line from (183, 74) to (442, 225).
; PLAN: r0=162(x), r1=58(y), r2=65(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=79(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=183(x1), r11=74(y1), r12=442(x2), r13=225(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 58
LDI r2, 65
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 79
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 183
LDI r11, 74
LDI r12, 442
LDI r13, 225
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
