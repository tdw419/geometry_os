; DESCRIPTION: Renders a cyan disk with center (380, 119) and radius 50.
; PLAN: r0=380(x), r1=119(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 119
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
