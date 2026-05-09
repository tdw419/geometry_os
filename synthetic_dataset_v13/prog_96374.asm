; DESCRIPTION: Composite: Renders a black line between points (258, 132) and (3, 66) then Creates a magenta rectangular region at (68, 136) spanning 52 by 42 pixels.
; PLAN: r0=258(x1), r1=132(y1), r2=3(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=136(y), r7=52(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 132
LDI r2, 3
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 136
LDI r7, 52
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
