; DESCRIPTION: Composite: Creates a purple rectangular region at (87, 50) spanning 63 by 105 pixels then Sets a single yellow pixel at (146, 238) then Renders a cyan line between points (311, 1) and (105, 124).
; PLAN: r0=87(x), r1=50(y), r2=63(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=311(x1), r11=1(y1), r12=105(x2), r13=124(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 50
LDI r2, 63
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 311
LDI r11, 1
LDI r12, 105
LDI r13, 124
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
