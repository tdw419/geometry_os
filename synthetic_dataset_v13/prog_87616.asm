; DESCRIPTION: Renders a cyan disk with center (196, 199) and radius 48.
; PLAN: r0=196(x), r1=199(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 199
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
