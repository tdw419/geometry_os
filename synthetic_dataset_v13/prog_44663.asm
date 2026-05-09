; DESCRIPTION: Places a orange 93x92 rectangle at position (291, 155).
; PLAN: r0=291(x), r1=155(y), r2=93(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 155
LDI r2, 93
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
