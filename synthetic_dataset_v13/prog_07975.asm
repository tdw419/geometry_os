; DESCRIPTION: Places a white circle of radius 25 at center (483, 50).
; PLAN: r0=483(x), r1=50(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 483
LDI r1, 50
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
