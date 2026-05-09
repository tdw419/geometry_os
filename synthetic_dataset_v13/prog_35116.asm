; DESCRIPTION: Renders a cyan disk with center (451, 206) and radius 16.
; PLAN: r0=451(x), r1=206(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 206
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
