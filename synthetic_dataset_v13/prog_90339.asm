; DESCRIPTION: Draws a green line from (161, 102) to (63, 76).
; PLAN: r0=161(x1), r1=102(y1), r2=63(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 102
LDI r2, 63
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
