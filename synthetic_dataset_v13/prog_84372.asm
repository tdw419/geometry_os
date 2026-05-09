; DESCRIPTION: Renders a red disk with center (386, 109) and radius 56.
; PLAN: r0=386(x), r1=109(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 109
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
