; DESCRIPTION: Composite: Places a green dot at position (330, 61) then Places a blue line segment connecting (11, 144) to (122, 1) then Creates a magenta rectangular region at (115, 36) spanning 46 by 86 pixels.
; PLAN: r0=330(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=11(x1), r6=144(y1), r7=122(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=36(y), r12=46(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 11
LDI r6, 144
LDI r7, 122
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 36
LDI r12, 46
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
