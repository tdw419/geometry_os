; DESCRIPTION: Renders a cyan disk with center (160, 61) and radius 25.
; PLAN: r0=160(x), r1=61(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 61
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
