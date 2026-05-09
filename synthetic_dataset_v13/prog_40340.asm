; DESCRIPTION: Places a green circle of radius 45 at center (385, 167).
; PLAN: r0=385(x), r1=167(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 167
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
