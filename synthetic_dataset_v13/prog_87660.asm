; DESCRIPTION: Draws a red rectangle at (68, 162) with width 93 and height 16.
; PLAN: r0=68(x), r1=162(y), r2=93(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 162
LDI r2, 93
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
