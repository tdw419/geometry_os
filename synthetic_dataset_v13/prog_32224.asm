; DESCRIPTION: Draws a white line from (300, 9) to (257, 79).
; PLAN: r0=300(x1), r1=9(y1), r2=257(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 9
LDI r2, 257
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
