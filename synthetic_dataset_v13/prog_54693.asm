; DESCRIPTION: Renders a cyan disk with center (31, 174) and radius 16.
; PLAN: r0=31(x), r1=174(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 174
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
