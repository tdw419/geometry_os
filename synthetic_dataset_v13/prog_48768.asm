; DESCRIPTION: Draws a blue line from (194, 15) to (479, 138).
; PLAN: r0=194(x1), r1=15(y1), r2=479(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 15
LDI r2, 479
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
