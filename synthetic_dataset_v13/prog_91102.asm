; DESCRIPTION: Composite: Places a blue dot at position (434, 6) then Places a magenta 71x48 rectangle at position (247, 74).
; PLAN: r0=434(x), r1=6(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=74(y), r7=71(width), r8=48(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 6
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 74
LDI r7, 71
LDI r8, 48
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
