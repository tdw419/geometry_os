; DESCRIPTION: Renders a cyan disk with center (127, 158) and radius 47.
; PLAN: r0=127(x), r1=158(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 158
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
