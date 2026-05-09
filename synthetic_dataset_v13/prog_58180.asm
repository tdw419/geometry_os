; DESCRIPTION: Renders a yellow disk with center (374, 168) and radius 30.
; PLAN: r0=374(x), r1=168(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 168
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
