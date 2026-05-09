; DESCRIPTION: Draws a green line from (377, 150) to (399, 156).
; PLAN: r0=377(x1), r1=150(y1), r2=399(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 150
LDI r2, 399
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
