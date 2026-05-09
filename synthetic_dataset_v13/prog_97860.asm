; DESCRIPTION: Places a red 35x114 rectangle at position (19, 48).
; PLAN: r0=19(x), r1=48(y), r2=35(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 48
LDI r2, 35
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
