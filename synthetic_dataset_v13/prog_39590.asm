; DESCRIPTION: Places a red line segment connecting (282, 197) to (274, 219).
; PLAN: r0=282(x1), r1=197(y1), r2=274(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 197
LDI r2, 274
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
