; DESCRIPTION: Renders a cyan disk with center (354, 135) and radius 75.
; PLAN: r0=354(x), r1=135(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 135
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
