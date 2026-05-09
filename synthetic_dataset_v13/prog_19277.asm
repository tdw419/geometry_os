; DESCRIPTION: Composite: Places a magenta dot at position (294, 254) then Draws a green rectangle at (420, 177) with width 67 and height 10.
; PLAN: r0=294(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=177(y), r7=67(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 177
LDI r7, 67
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
