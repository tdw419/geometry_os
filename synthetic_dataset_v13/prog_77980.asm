; DESCRIPTION: Draws a magenta line from (87, 176) to (388, 38).
; PLAN: r0=87(x1), r1=176(y1), r2=388(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 388
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
