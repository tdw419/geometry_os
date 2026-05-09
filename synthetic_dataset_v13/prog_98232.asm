; DESCRIPTION: Draws a green line from (244, 244) to (35, 219).
; PLAN: r0=244(x1), r1=244(y1), r2=35(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 244
LDI r2, 35
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
