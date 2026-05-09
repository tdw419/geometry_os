; DESCRIPTION: Places a white circle of radius 70 at center (115, 126).
; PLAN: r0=115(x), r1=126(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 126
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
