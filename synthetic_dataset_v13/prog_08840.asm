; DESCRIPTION: Renders a cyan disk with center (188, 135) and radius 49.
; PLAN: r0=188(x), r1=135(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 135
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
