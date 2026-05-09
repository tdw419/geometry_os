; DESCRIPTION: Draws a black line from (293, 211) to (465, 62).
; PLAN: r0=293(x1), r1=211(y1), r2=465(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 211
LDI r2, 465
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
