; DESCRIPTION: Renders a cyan disk with center (392, 159) and radius 22.
; PLAN: r0=392(x), r1=159(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 159
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
