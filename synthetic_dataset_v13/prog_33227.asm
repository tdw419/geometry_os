; DESCRIPTION: Places a green circle of radius 17 at center (413, 237).
; PLAN: r0=413(x), r1=237(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 237
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
