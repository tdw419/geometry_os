; DESCRIPTION: Renders a green disk with center (420, 168) and radius 74.
; PLAN: r0=420(x), r1=168(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 168
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
