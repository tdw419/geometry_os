; DESCRIPTION: Renders a cyan disk with center (20, 68) and radius 13.
; PLAN: r0=20(x), r1=68(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 68
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
