; DESCRIPTION: Places a green circle of radius 10 at center (309, 214).
; PLAN: r0=309(x), r1=214(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 214
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
