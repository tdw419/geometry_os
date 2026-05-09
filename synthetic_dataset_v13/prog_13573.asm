; DESCRIPTION: Places a black circle of radius 24 at center (127, 186).
; PLAN: r0=127(x), r1=186(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 186
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
