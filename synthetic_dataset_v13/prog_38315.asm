; DESCRIPTION: Draws a green line from (453, 207) to (180, 116).
; PLAN: r0=453(x1), r1=207(y1), r2=180(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 207
LDI r2, 180
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
