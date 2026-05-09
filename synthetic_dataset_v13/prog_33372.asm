; DESCRIPTION: Places a red 74x96 rectangle at position (230, 106).
; PLAN: r0=230(x), r1=106(y), r2=74(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 106
LDI r2, 74
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
