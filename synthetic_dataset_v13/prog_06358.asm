; DESCRIPTION: Renders a cyan disk with center (373, 198) and radius 24.
; PLAN: r0=373(x), r1=198(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 198
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
