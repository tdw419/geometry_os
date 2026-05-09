; DESCRIPTION: Composite: Sets a single magenta pixel at (502, 225) then Places a magenta 113x30 rectangle at position (190, 132).
; PLAN: r0=502(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=132(y), r7=113(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 132
LDI r7, 113
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
