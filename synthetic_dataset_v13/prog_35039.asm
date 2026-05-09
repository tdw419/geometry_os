; DESCRIPTION: Places a black circle of radius 17 at center (450, 188).
; PLAN: r0=450(x), r1=188(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 188
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
