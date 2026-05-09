; DESCRIPTION: Composite: Places a blue dot at position (168, 125) then Places a blue circle of radius 67 at center (183, 92).
; PLAN: r0=168(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=92(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 92
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
