; DESCRIPTION: Places a blue circle of radius 77 at center (205, 103).
; PLAN: r0=205(x), r1=103(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 103
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
