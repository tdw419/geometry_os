; DESCRIPTION: Renders a red disk with center (167, 91) and radius 54.
; PLAN: r0=167(x), r1=91(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 91
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
