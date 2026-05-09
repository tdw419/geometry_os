; DESCRIPTION: Renders a red disk with center (401, 77) and radius 76.
; PLAN: r0=401(x), r1=77(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 77
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
