; DESCRIPTION: Places a orange line segment connecting (239, 225) to (346, 163).
; PLAN: r0=239(x1), r1=225(y1), r2=346(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 225
LDI r2, 346
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
