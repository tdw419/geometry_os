; DESCRIPTION: Renders a cyan disk with center (435, 151) and radius 27.
; PLAN: r0=435(x), r1=151(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 151
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
