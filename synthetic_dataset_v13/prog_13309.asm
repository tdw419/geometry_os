; DESCRIPTION: Renders a cyan disk with center (268, 127) and radius 33.
; PLAN: r0=268(x), r1=127(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 127
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
