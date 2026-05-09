; DESCRIPTION: Renders a cyan disk with center (352, 232) and radius 14.
; PLAN: r0=352(x), r1=232(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 232
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
