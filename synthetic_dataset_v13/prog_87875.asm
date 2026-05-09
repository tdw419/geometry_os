; DESCRIPTION: Renders a cyan disk with center (160, 132) and radius 79.
; PLAN: r0=160(x), r1=132(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 132
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
