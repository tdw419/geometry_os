; DESCRIPTION: Composite: Places a magenta dot at position (82, 249) then Places a purple 111x21 rectangle at position (325, 82).
; PLAN: r0=82(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=82(y), r7=111(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 82
LDI r7, 111
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
