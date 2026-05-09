; DESCRIPTION: Places a orange 36x102 rectangle at position (115, 56).
; PLAN: r0=115(x), r1=56(y), r2=36(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 56
LDI r2, 36
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
