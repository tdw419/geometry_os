; DESCRIPTION: Renders a red disk with center (294, 93) and radius 33.
; PLAN: r0=294(x), r1=93(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 93
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
