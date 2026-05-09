; DESCRIPTION: Composite: Draws a blue rectangle at (389, 121) with width 59 and height 12 then Places a magenta dot at position (103, 74).
; PLAN: r0=389(x), r1=121(y), r2=59(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=74(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 121
LDI r2, 59
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 74
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
