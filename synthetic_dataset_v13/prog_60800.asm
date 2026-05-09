; DESCRIPTION: Composite: Places a red dot at position (121, 166) then Renders a white disk with center (67, 224) and radius 19.
; PLAN: r0=121(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=224(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 67
LDI r6, 224
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
