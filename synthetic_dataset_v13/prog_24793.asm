; DESCRIPTION: Composite: Places a white dot at position (388, 63) then Places a yellow line segment connecting (127, 56) to (188, 78) then Creates a cyan rectangular region at (12, 58) spanning 42 by 79 pixels.
; PLAN: r0=388(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=56(y1), r7=188(x2), r8=78(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=58(y), r12=42(width), r13=79(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 56
LDI r7, 188
LDI r8, 78
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 58
LDI r12, 42
LDI r13, 79
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
