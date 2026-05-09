; DESCRIPTION: Draws a green line from (26, 95) to (122, 237).
; PLAN: r0=26(x1), r1=95(y1), r2=122(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 95
LDI r2, 122
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
