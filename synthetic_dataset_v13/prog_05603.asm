; DESCRIPTION: Composite: Sets a single cyan pixel at (458, 228) then Renders a yellow line between points (414, 63) and (429, 118) then Creates a magenta rectangular region at (286, 114) spanning 66 by 49 pixels.
; PLAN: r0=458(x), r1=228(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=63(y1), r7=429(x2), r8=118(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=114(y), r12=66(width), r13=49(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 228
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 63
LDI r7, 429
LDI r8, 118
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 114
LDI r12, 66
LDI r13, 49
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
