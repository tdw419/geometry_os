; DESCRIPTION: Creates a blue circular shape at (445, 174) with radius 35.
; PLAN: r0=445(x), r1=174(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 174
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
