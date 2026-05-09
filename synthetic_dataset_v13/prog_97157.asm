; DESCRIPTION: Places a white circle of radius 21 at center (45, 127).
; PLAN: r0=45(x), r1=127(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 127
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
