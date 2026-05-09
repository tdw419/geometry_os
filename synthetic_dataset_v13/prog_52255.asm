; DESCRIPTION: Renders a green disk with center (460, 74) and radius 20.
; PLAN: r0=460(x), r1=74(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 74
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
