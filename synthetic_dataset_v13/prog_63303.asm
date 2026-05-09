; DESCRIPTION: Composite: Sets a single black pixel at (273, 19) then Places a purple 12x67 rectangle at position (210, 148).
; PLAN: r0=273(x), r1=19(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=148(y), r7=12(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 19
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 210
LDI r6, 148
LDI r7, 12
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
