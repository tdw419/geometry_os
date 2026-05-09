; DESCRIPTION: Places a green circle of radius 31 at center (282, 146).
; PLAN: r0=282(x), r1=146(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 146
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
