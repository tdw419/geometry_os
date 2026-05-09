; DESCRIPTION: Renders a cyan disk with center (374, 63) and radius 62.
; PLAN: r0=374(x), r1=63(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 63
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
