; DESCRIPTION: Composite: Renders a red disk with center (102, 67) and radius 60 then Sets a single magenta pixel at (21, 190).
; PLAN: r0=102(x), r1=67(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=190(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 67
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 190
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
