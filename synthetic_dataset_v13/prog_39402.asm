; DESCRIPTION: Draws a green line from (192, 100) to (509, 60).
; PLAN: r0=192(x1), r1=100(y1), r2=509(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 100
LDI r2, 509
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
