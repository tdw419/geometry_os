; DESCRIPTION: Renders a yellow disk with center (420, 196) and radius 16.
; PLAN: r0=420(x), r1=196(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 196
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
