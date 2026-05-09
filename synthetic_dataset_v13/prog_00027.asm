; DESCRIPTION: Draws a green line from (293, 103) to (388, 170).
; PLAN: r0=293(x1), r1=103(y1), r2=388(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 103
LDI r2, 388
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
