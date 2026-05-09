; DESCRIPTION: Draws a black line from (501, 64) to (39, 24).
; PLAN: r0=501(x1), r1=64(y1), r2=39(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 64
LDI r2, 39
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
