; DESCRIPTION: Renders a cyan disk with center (73, 167) and radius 68.
; PLAN: r0=73(x), r1=167(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 167
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
