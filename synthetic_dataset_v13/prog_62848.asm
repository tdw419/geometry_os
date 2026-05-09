; DESCRIPTION: Renders a cyan disk with center (456, 179) and radius 49.
; PLAN: r0=456(x), r1=179(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 179
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
