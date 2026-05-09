; DESCRIPTION: Places a orange circle of radius 10 at center (113, 121).
; PLAN: r0=113(x), r1=121(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 121
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
