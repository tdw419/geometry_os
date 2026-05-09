; DESCRIPTION: Draws a red rectangle at (269, 131) with width 93 and height 74.
; PLAN: r0=269(x), r1=131(y), r2=93(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 131
LDI r2, 93
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
