; DESCRIPTION: Draws a green line from (120, 112) to (181, 32).
; PLAN: r0=120(x1), r1=112(y1), r2=181(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 112
LDI r2, 181
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
