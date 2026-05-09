; DESCRIPTION: Draws a red line from (293, 45) to (72, 30).
; PLAN: r0=293(x1), r1=45(y1), r2=72(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 45
LDI r2, 72
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
