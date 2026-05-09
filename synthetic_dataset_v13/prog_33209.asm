; DESCRIPTION: Places a white circle of radius 50 at center (127, 136).
; PLAN: r0=127(x), r1=136(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 136
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
