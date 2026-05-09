; DESCRIPTION: Renders a cyan disk with center (38, 125) and radius 28.
; PLAN: r0=38(x), r1=125(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 125
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
