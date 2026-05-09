; DESCRIPTION: Renders a magenta disk with center (41, 164) and radius 27.
; PLAN: r0=41(x), r1=164(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 164
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
