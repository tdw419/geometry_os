; DESCRIPTION: Renders a cyan disk with center (96, 93) and radius 72.
; PLAN: r0=96(x), r1=93(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 93
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
