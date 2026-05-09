; DESCRIPTION: Renders a cyan disk with center (230, 133) and radius 69.
; PLAN: r0=230(x), r1=133(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 133
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
