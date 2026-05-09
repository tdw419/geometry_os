; DESCRIPTION: Renders a cyan disk with center (377, 141) and radius 46.
; PLAN: r0=377(x), r1=141(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 141
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
