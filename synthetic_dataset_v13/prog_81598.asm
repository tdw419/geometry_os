; DESCRIPTION: Renders a cyan disk with center (215, 68) and radius 30.
; PLAN: r0=215(x), r1=68(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 68
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
