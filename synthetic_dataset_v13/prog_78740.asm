; DESCRIPTION: Places a orange 94x15 rectangle at position (105, 167).
; PLAN: r0=105(x), r1=167(y), r2=94(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 167
LDI r2, 94
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
