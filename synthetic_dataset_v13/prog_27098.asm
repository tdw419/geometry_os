; DESCRIPTION: Draws a green line from (350, 79) to (257, 174).
; PLAN: r0=350(x1), r1=79(y1), r2=257(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 79
LDI r2, 257
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
