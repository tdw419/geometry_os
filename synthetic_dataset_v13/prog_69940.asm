; DESCRIPTION: Places a red 80x114 rectangle at position (239, 84).
; PLAN: r0=239(x), r1=84(y), r2=80(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 84
LDI r2, 80
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
