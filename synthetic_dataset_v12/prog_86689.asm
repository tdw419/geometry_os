; DESCRIPTION: Renders a cyan disk with center (288, 96) and radius 21.
; PLAN: r0=288(x), r1=96(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 96
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
