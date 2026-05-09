; DESCRIPTION: Renders a cyan disk with center (151, 120) and radius 42.
; PLAN: r0=151(x), r1=120(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 120
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
