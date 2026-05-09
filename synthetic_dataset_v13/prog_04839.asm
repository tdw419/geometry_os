; DESCRIPTION: Renders a red disk with center (401, 109) and radius 33.
; PLAN: r0=401(x), r1=109(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 109
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
