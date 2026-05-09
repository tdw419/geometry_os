; DESCRIPTION: Draws a cyan rectangle at (247, 93) with width 101 and height 68.
; PLAN: r0=247(x), r1=93(y), r2=101(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 93
LDI r2, 101
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
