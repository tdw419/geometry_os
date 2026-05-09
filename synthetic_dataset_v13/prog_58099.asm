; DESCRIPTION: Draws a black line from (29, 157) to (474, 184).
; PLAN: r0=29(x1), r1=157(y1), r2=474(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 157
LDI r2, 474
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
