; DESCRIPTION: Draws a green line from (331, 116) to (467, 51).
; PLAN: r0=331(x1), r1=116(y1), r2=467(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 116
LDI r2, 467
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
