; DESCRIPTION: Draws a green line from (398, 45) to (496, 244).
; PLAN: r0=398(x1), r1=45(y1), r2=496(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 45
LDI r2, 496
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
