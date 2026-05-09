; DESCRIPTION: Places a orange 25x119 rectangle at position (3, 28).
; PLAN: r0=3(x), r1=28(y), r2=25(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 25
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
