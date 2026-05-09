; DESCRIPTION: Places a red 36x88 rectangle at position (166, 56).
; PLAN: r0=166(x), r1=56(y), r2=36(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 56
LDI r2, 36
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
