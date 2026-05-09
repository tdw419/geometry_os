; DESCRIPTION: Places a orange circle of radius 35 at center (319, 95).
; PLAN: r0=319(x), r1=95(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 95
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
