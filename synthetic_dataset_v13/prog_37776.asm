; DESCRIPTION: Draws a purple line from (297, 149) to (474, 82).
; PLAN: r0=297(x1), r1=149(y1), r2=474(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 149
LDI r2, 474
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
