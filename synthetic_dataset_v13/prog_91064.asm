; DESCRIPTION: Renders a cyan disk with center (243, 137) and radius 56.
; PLAN: r0=243(x), r1=137(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 137
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
