; DESCRIPTION: Places a green circle of radius 35 at center (303, 143).
; PLAN: r0=303(x), r1=143(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 143
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
