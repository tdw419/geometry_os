; DESCRIPTION: Places a white circle of radius 10 at center (470, 36).
; PLAN: r0=470(x), r1=36(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 36
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
