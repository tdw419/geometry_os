; DESCRIPTION: Places a black circle of radius 65 at center (188, 86).
; PLAN: r0=188(x), r1=86(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 86
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
