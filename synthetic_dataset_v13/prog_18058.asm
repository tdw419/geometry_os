; DESCRIPTION: Places a green circle of radius 46 at center (141, 54).
; PLAN: r0=141(x), r1=54(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 54
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
