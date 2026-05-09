; DESCRIPTION: Renders a yellow disk with center (294, 65) and radius 14.
; PLAN: r0=294(x), r1=65(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 65
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
