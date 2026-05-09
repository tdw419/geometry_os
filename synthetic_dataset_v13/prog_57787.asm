; DESCRIPTION: Composite: Renders a purple box of size 52x53 starting at (270, 148) then Sets a single white pixel at (171, 153).
; PLAN: r0=270(x), r1=148(y), r2=52(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=153(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 148
LDI r2, 52
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 153
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
