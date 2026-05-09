; DESCRIPTION: Draws a green line from (120, 211) to (293, 26).
; PLAN: r0=120(x1), r1=211(y1), r2=293(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 211
LDI r2, 293
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
