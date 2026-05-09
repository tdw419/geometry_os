; DESCRIPTION: Renders a yellow disk with center (275, 129) and radius 57.
; PLAN: r0=275(x), r1=129(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 129
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
