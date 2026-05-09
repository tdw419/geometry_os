; DESCRIPTION: Places a white circle of radius 21 at center (168, 97).
; PLAN: r0=168(x), r1=97(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 97
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
