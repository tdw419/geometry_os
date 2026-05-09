; DESCRIPTION: Renders a cyan disk with center (460, 142) and radius 25.
; PLAN: r0=460(x), r1=142(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 142
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
