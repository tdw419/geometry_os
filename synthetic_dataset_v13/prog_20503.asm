; DESCRIPTION: Places a green circle of radius 30 at center (184, 225).
; PLAN: r0=184(x), r1=225(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 225
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
