; DESCRIPTION: Places a white circle of radius 55 at center (103, 126).
; PLAN: r0=103(x), r1=126(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 126
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
