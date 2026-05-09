; DESCRIPTION: Places a orange circle of radius 26 at center (395, 95).
; PLAN: r0=395(x), r1=95(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 95
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
