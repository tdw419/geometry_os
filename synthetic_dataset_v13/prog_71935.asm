; DESCRIPTION: Places a green circle of radius 47 at center (333, 106).
; PLAN: r0=333(x), r1=106(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 106
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
