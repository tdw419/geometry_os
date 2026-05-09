; DESCRIPTION: Draws a green line from (419, 38) to (265, 10).
; PLAN: r0=419(x1), r1=38(y1), r2=265(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 38
LDI r2, 265
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
