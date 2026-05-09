; DESCRIPTION: Places a green line segment connecting (380, 4) to (38, 219).
; PLAN: r0=380(x1), r1=4(y1), r2=38(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 4
LDI r2, 38
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
