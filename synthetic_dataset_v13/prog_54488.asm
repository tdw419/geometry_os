; DESCRIPTION: Renders a cyan disk with center (110, 149) and radius 21.
; PLAN: r0=110(x), r1=149(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 149
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
