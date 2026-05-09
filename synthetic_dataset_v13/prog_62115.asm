; DESCRIPTION: Draws a black line from (359, 249) to (257, 58).
; PLAN: r0=359(x1), r1=249(y1), r2=257(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 249
LDI r2, 257
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
