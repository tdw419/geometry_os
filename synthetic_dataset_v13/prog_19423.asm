; DESCRIPTION: Places a green line segment connecting (244, 253) to (299, 250).
; PLAN: r0=244(x1), r1=253(y1), r2=299(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 253
LDI r2, 299
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
