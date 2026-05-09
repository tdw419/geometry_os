; DESCRIPTION: Draws a green line from (36, 215) to (293, 199).
; PLAN: r0=36(x1), r1=215(y1), r2=293(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 215
LDI r2, 293
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
