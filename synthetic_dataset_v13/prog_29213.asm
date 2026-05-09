; DESCRIPTION: Draws a magenta line from (469, 192) to (442, 115).
; PLAN: r0=469(x1), r1=192(y1), r2=442(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 192
LDI r2, 442
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
