; DESCRIPTION: Places a green circle of radius 33 at center (42, 90).
; PLAN: r0=42(x), r1=90(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 90
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
