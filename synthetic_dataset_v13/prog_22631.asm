; DESCRIPTION: Composite: Renders a black box of size 102x36 starting at (33, 134) then Renders a purple disk with center (228, 145) and radius 43.
; PLAN: r0=33(x), r1=134(y), r2=102(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=145(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 134
LDI r2, 102
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 145
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
