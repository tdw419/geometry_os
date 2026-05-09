; DESCRIPTION: Renders a cyan disk with center (387, 125) and radius 69.
; PLAN: r0=387(x), r1=125(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 125
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
