; DESCRIPTION: Composite: Sets a single purple pixel at (34, 228) then Draws a purple rectangle at (113, 50) with width 71 and height 51.
; PLAN: r0=34(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=50(y), r7=71(width), r8=51(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 50
LDI r7, 71
LDI r8, 51
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
