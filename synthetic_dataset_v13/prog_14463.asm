; DESCRIPTION: Places a red 74x46 rectangle at position (158, 29).
; PLAN: r0=158(x), r1=29(y), r2=74(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 29
LDI r2, 74
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
