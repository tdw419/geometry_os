; DESCRIPTION: Composite: Draws a cyan circle centered at (196, 99) with radius 62 then Places a magenta line segment connecting (301, 253) to (479, 112) then Creates a green rectangular region at (149, 40) spanning 61 by 79 pixels.
; PLAN: r0=196(x), r1=99(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=253(y1), r7=479(x2), r8=112(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=40(y), r12=61(width), r13=79(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 99
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 253
LDI r7, 479
LDI r8, 112
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 40
LDI r12, 61
LDI r13, 79
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
