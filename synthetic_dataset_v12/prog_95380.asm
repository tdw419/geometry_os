; DESCRIPTION: Places a orange 28x35 rectangle at position (86, 1).
; PLAN: r0=86(x), r1=1(y), r2=28(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 1
LDI r2, 28
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
