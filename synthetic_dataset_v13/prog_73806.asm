; DESCRIPTION: Draws a purple line from (145, 175) to (257, 42).
; PLAN: r0=145(x1), r1=175(y1), r2=257(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 175
LDI r2, 257
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
