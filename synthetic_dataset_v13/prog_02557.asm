; DESCRIPTION: Composite: Renders a magenta box of size 79x31 starting at (118, 11) then Draws a cyan circle centered at (452, 45) with radius 42 then Renders a yellow line between points (86, 183) and (82, 102).
; PLAN: r0=118(x), r1=11(y), r2=79(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=45(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=86(x1), r11=183(y1), r12=82(x2), r13=102(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 11
LDI r2, 79
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 45
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 86
LDI r11, 183
LDI r12, 82
LDI r13, 102
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
