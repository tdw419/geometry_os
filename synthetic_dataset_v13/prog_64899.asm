; DESCRIPTION: Renders a green disk with center (410, 64) and radius 14.
; PLAN: r0=410(x), r1=64(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 64
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
