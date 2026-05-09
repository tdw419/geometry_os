; DESCRIPTION: Draws a blue line from (348, 128) to (487, 3).
; PLAN: r0=348(x1), r1=128(y1), r2=487(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 128
LDI r2, 487
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
