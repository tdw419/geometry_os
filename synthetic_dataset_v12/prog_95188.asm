; DESCRIPTION: Renders a cyan disk with center (372, 147) and radius 16.
; PLAN: r0=372(x), r1=147(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 147
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
