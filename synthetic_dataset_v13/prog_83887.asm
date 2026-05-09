; DESCRIPTION: Composite: Creates a yellow rectangular region at (198, 137) spanning 68 by 113 pixels then Draws a magenta line from (449, 247) to (290, 242) then Draws a green circle centered at (221, 206) with radius 48.
; PLAN: r0=198(x), r1=137(y), r2=68(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=247(y1), r7=290(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=206(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 137
LDI r2, 68
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 247
LDI r7, 290
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 206
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
