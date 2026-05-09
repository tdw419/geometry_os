; DESCRIPTION: Renders a red disk with center (102, 212) and radius 27.
; PLAN: r0=102(x), r1=212(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 212
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
