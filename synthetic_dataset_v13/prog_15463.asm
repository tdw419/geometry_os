; DESCRIPTION: Renders a red disk with center (313, 208) and radius 20.
; PLAN: r0=313(x), r1=208(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 208
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
