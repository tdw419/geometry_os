; DESCRIPTION: Renders a cyan disk with center (146, 158) and radius 58.
; PLAN: r0=146(x), r1=158(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 158
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
