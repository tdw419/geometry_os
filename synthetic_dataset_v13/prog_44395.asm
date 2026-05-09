; DESCRIPTION: Draws a red line from (90, 32) to (293, 50).
; PLAN: r0=90(x1), r1=32(y1), r2=293(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 32
LDI r2, 293
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
