; DESCRIPTION: Draws a green line from (202, 126) to (133, 81).
; PLAN: r0=202(x1), r1=126(y1), r2=133(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 126
LDI r2, 133
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
