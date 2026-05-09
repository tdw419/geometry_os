; DESCRIPTION: Places a green circle of radius 50 at center (311, 57).
; PLAN: r0=311(x), r1=57(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 57
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
