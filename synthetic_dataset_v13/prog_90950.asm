; DESCRIPTION: Renders a cyan disk with center (219, 50) and radius 24.
; PLAN: r0=219(x), r1=50(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 50
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
