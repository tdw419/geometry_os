; DESCRIPTION: Composite: Draws a magenta line from (59, 43) to (429, 198) then Sets a single cyan pixel at (54, 31) then Creates a orange rectangular region at (42, 23) spanning 27 by 113 pixels.
; PLAN: r0=59(x1), r1=43(y1), r2=429(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=31(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=42(x), r11=23(y), r12=27(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 43
LDI r2, 429
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 31
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 42
LDI r11, 23
LDI r12, 27
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
