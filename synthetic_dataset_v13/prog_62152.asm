; DESCRIPTION: Places a orange 117x69 rectangle at position (352, 93).
; PLAN: r0=352(x), r1=93(y), r2=117(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 93
LDI r2, 117
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
