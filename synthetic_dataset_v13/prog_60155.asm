; DESCRIPTION: Draws a green line from (4, 161) to (506, 84).
; PLAN: r0=4(x1), r1=161(y1), r2=506(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 161
LDI r2, 506
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
