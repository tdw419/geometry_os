; DESCRIPTION: Places a white circle of radius 36 at center (263, 137).
; PLAN: r0=263(x), r1=137(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 137
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
