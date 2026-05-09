; DESCRIPTION: Renders a cyan disk with center (262, 118) and radius 76.
; PLAN: r0=262(x), r1=118(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 118
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
