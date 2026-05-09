; DESCRIPTION: Places a cyan line segment connecting (500, 6) to (376, 239).
; PLAN: r0=500(x1), r1=6(y1), r2=376(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 6
LDI r2, 376
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
