; DESCRIPTION: Renders a cyan disk with center (365, 196) and radius 29.
; PLAN: r0=365(x), r1=196(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 196
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
