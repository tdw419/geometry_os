; DESCRIPTION: Places a blue circle of radius 16 at center (85, 187).
; PLAN: r0=85(x), r1=187(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 187
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
