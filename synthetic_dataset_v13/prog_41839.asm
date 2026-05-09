; DESCRIPTION: Composite: Places a magenta dot at position (313, 29) then Draws a orange rectangle at (436, 36) with width 39 and height 64.
; PLAN: r0=313(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=36(y), r7=39(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 36
LDI r7, 39
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
