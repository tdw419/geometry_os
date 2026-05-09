; DESCRIPTION: Draws a purple line from (116, 210) to (116, 16).
; PLAN: r0=116(x1), r1=210(y1), r2=116(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 210
LDI r2, 116
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
