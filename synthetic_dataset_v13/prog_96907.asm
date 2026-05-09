; DESCRIPTION: Draws a purple line from (260, 53) to (380, 16).
; PLAN: r0=260(x1), r1=53(y1), r2=380(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 53
LDI r2, 380
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
