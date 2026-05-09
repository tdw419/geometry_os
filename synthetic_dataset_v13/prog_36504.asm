; DESCRIPTION: Renders a cyan disk with center (407, 212) and radius 25.
; PLAN: r0=407(x), r1=212(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 212
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
