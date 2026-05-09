; DESCRIPTION: Renders a red disk with center (174, 57) and radius 18.
; PLAN: r0=174(x), r1=57(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 57
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
