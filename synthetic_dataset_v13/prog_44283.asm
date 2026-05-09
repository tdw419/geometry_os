; DESCRIPTION: Places a cyan line segment connecting (357, 151) to (500, 239).
; PLAN: r0=357(x1), r1=151(y1), r2=500(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 151
LDI r2, 500
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
