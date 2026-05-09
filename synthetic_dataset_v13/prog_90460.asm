; DESCRIPTION: Places a white circle of radius 42 at center (78, 127).
; PLAN: r0=78(x), r1=127(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 127
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
