; DESCRIPTION: Places a orange 40x12 rectangle at position (250, 101).
; PLAN: r0=250(x), r1=101(y), r2=40(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 101
LDI r2, 40
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
