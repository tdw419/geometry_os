; DESCRIPTION: Renders a red disk with center (243, 112) and radius 55.
; PLAN: r0=243(x), r1=112(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 112
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
