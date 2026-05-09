; DESCRIPTION: Composite: Places a blue 93x90 rectangle at position (184, 92) then Draws a orange circle centered at (118, 168) with radius 51.
; PLAN: r0=184(x), r1=92(y), r2=93(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=168(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 92
LDI r2, 93
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 168
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
