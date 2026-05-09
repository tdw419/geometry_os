; DESCRIPTION: Composite: Places a magenta dot at position (67, 195) then Places a blue circle of radius 53 at center (140, 173).
; PLAN: r0=67(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=173(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 173
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
