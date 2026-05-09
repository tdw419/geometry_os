; DESCRIPTION: Places a red 84x114 rectangle at position (226, 134).
; PLAN: r0=226(x), r1=134(y), r2=84(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 134
LDI r2, 84
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
