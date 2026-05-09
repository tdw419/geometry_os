; DESCRIPTION: Places a orange 35x24 rectangle at position (86, 74).
; PLAN: r0=86(x), r1=74(y), r2=35(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 74
LDI r2, 35
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
