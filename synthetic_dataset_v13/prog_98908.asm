; DESCRIPTION: Renders a cyan disk with center (442, 154) and radius 30.
; PLAN: r0=442(x), r1=154(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 154
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
