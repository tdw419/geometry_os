; DESCRIPTION: Places a red 100x84 rectangle at position (117, 166).
; PLAN: r0=117(x), r1=166(y), r2=100(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 166
LDI r2, 100
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
