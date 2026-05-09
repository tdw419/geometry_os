; DESCRIPTION: Renders a yellow disk with center (202, 50) and radius 10.
; PLAN: r0=202(x), r1=50(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 50
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
