; DESCRIPTION: Draws a black line from (220, 178) to (62, 8).
; PLAN: r0=220(x1), r1=178(y1), r2=62(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 178
LDI r2, 62
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
