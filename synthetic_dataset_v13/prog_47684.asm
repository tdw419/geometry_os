; DESCRIPTION: Draws a red rectangle at (399, 93) with width 58 and height 111.
; PLAN: r0=399(x), r1=93(y), r2=58(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 93
LDI r2, 58
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
