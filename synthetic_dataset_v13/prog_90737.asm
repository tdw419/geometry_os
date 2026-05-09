; DESCRIPTION: Renders a cyan disk with center (386, 98) and radius 59.
; PLAN: r0=386(x), r1=98(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 98
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
