; DESCRIPTION: Places a green circle of radius 42 at center (342, 130).
; PLAN: r0=342(x), r1=130(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 130
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
