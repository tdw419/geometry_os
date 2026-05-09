; DESCRIPTION: Draws a blue line from (345, 255) to (184, 13).
; PLAN: r0=345(x1), r1=255(y1), r2=184(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 255
LDI r2, 184
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
