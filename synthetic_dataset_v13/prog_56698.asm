; DESCRIPTION: Renders a cyan disk with center (70, 87) and radius 48.
; PLAN: r0=70(x), r1=87(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 87
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
