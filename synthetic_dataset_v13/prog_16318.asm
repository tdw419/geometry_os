; DESCRIPTION: Composite: Sets a single magenta pixel at (342, 49) then Places a magenta 48x15 rectangle at position (57, 221).
; PLAN: r0=342(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=221(y), r7=48(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 221
LDI r7, 48
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
