; DESCRIPTION: Composite: Renders a blue box of size 36x100 starting at (382, 116) then Sets a single white pixel at (121, 66).
; PLAN: r0=382(x), r1=116(y), r2=36(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=66(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 382
LDI r1, 116
LDI r2, 36
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 66
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
