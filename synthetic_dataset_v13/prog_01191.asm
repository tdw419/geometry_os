; DESCRIPTION: Renders a cyan disk with center (59, 174) and radius 11.
; PLAN: r0=59(x), r1=174(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 174
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
