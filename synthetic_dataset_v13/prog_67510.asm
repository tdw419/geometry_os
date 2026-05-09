; DESCRIPTION: Places a orange line segment connecting (387, 135) to (418, 164).
; PLAN: r0=387(x1), r1=135(y1), r2=418(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 135
LDI r2, 418
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
