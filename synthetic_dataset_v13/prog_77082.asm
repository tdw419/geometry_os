; DESCRIPTION: Composite: Places a white dot at position (86, 151) then Renders a purple box of size 94x57 starting at (356, 53).
; PLAN: r0=86(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=53(y), r7=94(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 151
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 53
LDI r7, 94
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
