; DESCRIPTION: Draws a blue line from (393, 126) to (252, 56).
; PLAN: r0=393(x1), r1=126(y1), r2=252(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 126
LDI r2, 252
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
