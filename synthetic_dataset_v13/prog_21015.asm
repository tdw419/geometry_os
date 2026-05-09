; DESCRIPTION: Composite: Sets a single magenta pixel at (403, 96) then Renders a green disk with center (204, 157) and radius 76.
; PLAN: r0=403(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=157(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 157
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
