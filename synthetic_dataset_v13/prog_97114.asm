; DESCRIPTION: Places a orange circle of radius 80 at center (212, 113).
; PLAN: r0=212(x), r1=113(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 113
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
