; DESCRIPTION: Draws a blue line from (473, 172) to (231, 120).
; PLAN: r0=473(x1), r1=172(y1), r2=231(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 172
LDI r2, 231
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
