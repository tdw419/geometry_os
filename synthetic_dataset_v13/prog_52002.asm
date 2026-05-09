; DESCRIPTION: Renders a cyan disk with center (181, 166) and radius 41.
; PLAN: r0=181(x), r1=166(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 166
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
