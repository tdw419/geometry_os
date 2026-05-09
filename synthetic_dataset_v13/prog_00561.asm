; DESCRIPTION: Places a green circle of radius 71 at center (223, 86).
; PLAN: r0=223(x), r1=86(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 86
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
