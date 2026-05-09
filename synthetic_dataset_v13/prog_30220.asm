; DESCRIPTION: Renders a cyan disk with center (69, 141) and radius 18.
; PLAN: r0=69(x), r1=141(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 141
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
