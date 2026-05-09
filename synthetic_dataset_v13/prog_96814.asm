; DESCRIPTION: Composite: Places a magenta dot at position (346, 165) then Places a purple 29x41 rectangle at position (42, 28).
; PLAN: r0=346(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=28(y), r7=29(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 28
LDI r7, 29
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
