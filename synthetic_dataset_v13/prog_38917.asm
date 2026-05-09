; DESCRIPTION: Draws a green line from (481, 10) to (106, 189).
; PLAN: r0=481(x1), r1=10(y1), r2=106(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 10
LDI r2, 106
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
