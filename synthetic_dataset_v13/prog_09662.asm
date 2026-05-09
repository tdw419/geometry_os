; DESCRIPTION: Renders a cyan disk with center (474, 164) and radius 13.
; PLAN: r0=474(x), r1=164(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 164
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
