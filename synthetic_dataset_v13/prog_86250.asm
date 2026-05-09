; DESCRIPTION: Composite: Creates a red rectangular region at (372, 99) spanning 62 by 94 pixels then Places a magenta line segment connecting (127, 215) to (169, 108) then Sets a single green pixel at (145, 245).
; PLAN: r0=372(x), r1=99(y), r2=62(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x1), r6=215(y1), r7=169(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=245(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 99
LDI r2, 62
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 215
LDI r7, 169
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 245
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
