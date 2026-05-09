; DESCRIPTION: Renders a cyan disk with center (302, 167) and radius 47.
; PLAN: r0=302(x), r1=167(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 167
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
