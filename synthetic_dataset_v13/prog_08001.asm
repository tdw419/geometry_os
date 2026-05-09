; DESCRIPTION: Places a red 62x95 rectangle at position (151, 123).
; PLAN: r0=151(x), r1=123(y), r2=62(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 123
LDI r2, 62
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
