; DESCRIPTION: Places a white circle of radius 56 at center (70, 126).
; PLAN: r0=70(x), r1=126(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 126
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
