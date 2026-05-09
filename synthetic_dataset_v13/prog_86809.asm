; DESCRIPTION: Composite: Renders a yellow line between points (191, 85) and (206, 224) then Sets a single magenta pixel at (311, 173).
; PLAN: r0=191(x1), r1=85(y1), r2=206(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=173(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 85
LDI r2, 206
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 173
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
