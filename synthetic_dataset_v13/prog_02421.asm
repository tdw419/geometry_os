; DESCRIPTION: Places a orange 52x69 rectangle at position (330, 25).
; PLAN: r0=330(x), r1=25(y), r2=52(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 25
LDI r2, 52
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
