; DESCRIPTION: Places a black line segment connecting (184, 164) to (502, 122).
; PLAN: r0=184(x1), r1=164(y1), r2=502(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 164
LDI r2, 502
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
