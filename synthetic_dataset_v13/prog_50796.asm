; DESCRIPTION: Composite: Places a green dot at position (22, 139) then Places a black 12x53 rectangle at position (209, 93).
; PLAN: r0=22(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=93(y), r7=12(width), r8=53(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 209
LDI r6, 93
LDI r7, 12
LDI r8, 53
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
