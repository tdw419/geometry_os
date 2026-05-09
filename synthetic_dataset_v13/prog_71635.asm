; DESCRIPTION: Places a orange 46x101 rectangle at position (167, 14).
; PLAN: r0=167(x), r1=14(y), r2=46(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 14
LDI r2, 46
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
