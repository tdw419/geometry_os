; DESCRIPTION: Places a green circle of radius 39 at center (247, 120).
; PLAN: r0=247(x), r1=120(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 120
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
