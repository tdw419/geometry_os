; DESCRIPTION: Places a green circle of radius 26 at center (122, 186).
; PLAN: r0=122(x), r1=186(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 186
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
