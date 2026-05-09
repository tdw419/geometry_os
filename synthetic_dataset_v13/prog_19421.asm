; DESCRIPTION: Renders a cyan disk with center (60, 86) and radius 59.
; PLAN: r0=60(x), r1=86(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 86
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
