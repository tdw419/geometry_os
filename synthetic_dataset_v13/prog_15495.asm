; DESCRIPTION: Renders a red disk with center (108, 129) and radius 76.
; PLAN: r0=108(x), r1=129(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 129
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
