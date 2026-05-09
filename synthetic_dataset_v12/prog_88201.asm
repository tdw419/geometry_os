; DESCRIPTION: Composite: Places a blue dot at position (216, 210) then Draws a white rectangle at (202, 90) with width 114 and height 102.
; PLAN: r0=216(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=90(y), r7=114(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 90
LDI r7, 114
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
