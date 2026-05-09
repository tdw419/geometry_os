; DESCRIPTION: Composite: Places a red dot at position (0, 117) then Renders a white disk with center (125, 122) and radius 67.
; PLAN: r0=0(x), r1=117(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=122(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 117
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 125
LDI r6, 122
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
