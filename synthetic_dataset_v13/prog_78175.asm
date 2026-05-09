; DESCRIPTION: Places a red 108x114 rectangle at position (25, 28).
; PLAN: r0=25(x), r1=28(y), r2=108(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 28
LDI r2, 108
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
