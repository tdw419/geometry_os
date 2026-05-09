; DESCRIPTION: Renders a green disk with center (403, 176) and radius 61.
; PLAN: r0=403(x), r1=176(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 176
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
