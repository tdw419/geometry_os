; DESCRIPTION: Places a orange line segment connecting (387, 239) to (425, 238).
; PLAN: r0=387(x1), r1=239(y1), r2=425(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 239
LDI r2, 425
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
