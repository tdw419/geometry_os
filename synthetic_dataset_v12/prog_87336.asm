; DESCRIPTION: Renders a red disk with center (296, 93) and radius 14.
; PLAN: r0=296(x), r1=93(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 93
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
