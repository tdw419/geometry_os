; DESCRIPTION: Places a orange 113x88 rectangle at position (68, 134).
; PLAN: r0=68(x), r1=134(y), r2=113(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 134
LDI r2, 113
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
