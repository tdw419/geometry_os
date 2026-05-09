; DESCRIPTION: Composite: Places a black dot at position (270, 245) then Places a magenta 28x82 rectangle at position (450, 112).
; PLAN: r0=270(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=112(y), r7=28(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 450
LDI r6, 112
LDI r7, 28
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
