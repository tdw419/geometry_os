; DESCRIPTION: Draws a green line from (282, 151) to (338, 219).
; PLAN: r0=282(x1), r1=151(y1), r2=338(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 151
LDI r2, 338
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
