; DESCRIPTION: Places a orange 50x101 rectangle at position (434, 88).
; PLAN: r0=434(x), r1=88(y), r2=50(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 88
LDI r2, 50
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
