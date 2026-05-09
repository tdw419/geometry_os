; DESCRIPTION: Composite: Sets a single magenta pixel at (128, 64) then Renders a yellow line between points (208, 143) and (218, 44) then Creates a orange rectangular region at (161, 132) spanning 102 by 29 pixels.
; PLAN: r0=128(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=143(y1), r7=218(x2), r8=44(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=132(y), r12=102(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 143
LDI r7, 218
LDI r8, 44
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 132
LDI r12, 102
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
