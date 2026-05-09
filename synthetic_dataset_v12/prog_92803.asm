; DESCRIPTION: Renders a cyan disk with center (243, 158) and radius 60.
; PLAN: r0=243(x), r1=158(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 158
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
