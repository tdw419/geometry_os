; DESCRIPTION: Places a red 118x70 rectangle at position (339, 153).
; PLAN: r0=339(x), r1=153(y), r2=118(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 153
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
