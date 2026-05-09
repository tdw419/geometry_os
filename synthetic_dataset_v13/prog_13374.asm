; DESCRIPTION: Draws a white line from (257, 109) to (319, 86).
; PLAN: r0=257(x1), r1=109(y1), r2=319(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 109
LDI r2, 319
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
