; DESCRIPTION: Renders a red disk with center (438, 151) and radius 57.
; PLAN: r0=438(x), r1=151(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 151
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
