; DESCRIPTION: Places a orange 70x38 rectangle at position (59, 75).
; PLAN: r0=59(x), r1=75(y), r2=70(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 75
LDI r2, 70
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
