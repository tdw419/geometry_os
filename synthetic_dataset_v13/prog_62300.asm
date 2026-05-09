; DESCRIPTION: Composite: Places a purple dot at position (415, 114) then Draws a yellow rectangle at (417, 16) with width 95 and height 45.
; PLAN: r0=415(x), r1=114(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=16(y), r7=95(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 114
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 16
LDI r7, 95
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
