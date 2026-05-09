; DESCRIPTION: Places a white circle of radius 75 at center (160, 127).
; PLAN: r0=160(x), r1=127(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 127
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
