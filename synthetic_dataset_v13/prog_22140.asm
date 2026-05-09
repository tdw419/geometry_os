; DESCRIPTION: Renders a green disk with center (352, 163) and radius 77.
; PLAN: r0=352(x), r1=163(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 163
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
