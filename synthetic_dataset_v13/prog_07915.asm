; DESCRIPTION: Renders a red disk with center (271, 109) and radius 46.
; PLAN: r0=271(x), r1=109(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 109
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
