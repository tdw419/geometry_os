; DESCRIPTION: Places a orange 74x43 rectangle at position (210, 6).
; PLAN: r0=210(x), r1=6(y), r2=74(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 6
LDI r2, 74
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
