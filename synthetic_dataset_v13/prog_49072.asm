; DESCRIPTION: Renders a cyan disk with center (420, 22) and radius 22.
; PLAN: r0=420(x), r1=22(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 22
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
