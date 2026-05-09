; DESCRIPTION: Renders a red disk with center (352, 191) and radius 28.
; PLAN: r0=352(x), r1=191(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 191
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
