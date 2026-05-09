; DESCRIPTION: Composite: Places a magenta dot at position (14, 187) then Places a purple 42x12 rectangle at position (71, 72).
; PLAN: r0=14(x), r1=187(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=72(y), r7=42(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 187
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 72
LDI r7, 42
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
