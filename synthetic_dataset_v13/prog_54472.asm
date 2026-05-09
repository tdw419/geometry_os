; DESCRIPTION: Renders a cyan disk with center (246, 221) and radius 22.
; PLAN: r0=246(x), r1=221(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 221
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
