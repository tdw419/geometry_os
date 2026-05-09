; DESCRIPTION: Composite: Places a magenta dot at position (421, 151) then Draws a red rectangle at (20, 107) with width 28 and height 103.
; PLAN: r0=421(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=107(y), r7=28(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 107
LDI r7, 28
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
