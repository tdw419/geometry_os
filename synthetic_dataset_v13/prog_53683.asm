; DESCRIPTION: Renders a cyan disk with center (102, 93) and radius 28.
; PLAN: r0=102(x), r1=93(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 93
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
