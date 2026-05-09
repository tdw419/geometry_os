; DESCRIPTION: Composite: Creates a magenta rectangular region at (379, 71) spanning 89 by 31 pixels then Places a red dot at position (357, 87) then Renders a blue line between points (419, 64) and (164, 94).
; PLAN: r0=379(x), r1=71(y), r2=89(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=64(y1), r12=164(x2), r13=94(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 71
LDI r2, 89
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 419
LDI r11, 64
LDI r12, 164
LDI r13, 94
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
