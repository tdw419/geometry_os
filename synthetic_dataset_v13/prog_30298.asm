; DESCRIPTION: Renders a cyan disk with center (271, 175) and radius 80.
; PLAN: r0=271(x), r1=175(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 175
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
