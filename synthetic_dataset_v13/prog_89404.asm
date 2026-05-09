; DESCRIPTION: Draws a blue line from (290, 126) to (466, 133).
; PLAN: r0=290(x1), r1=126(y1), r2=466(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 126
LDI r2, 466
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
