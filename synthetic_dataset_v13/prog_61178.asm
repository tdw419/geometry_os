; DESCRIPTION: Composite: Draws a green line from (290, 86) to (421, 156) then Sets a single yellow pixel at (14, 255) then Creates a cyan rectangular region at (68, 38) spanning 81 by 64 pixels.
; PLAN: r0=290(x1), r1=86(y1), r2=421(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=38(y), r12=81(width), r13=64(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 86
LDI r2, 421
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 68
LDI r11, 38
LDI r12, 81
LDI r13, 64
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
