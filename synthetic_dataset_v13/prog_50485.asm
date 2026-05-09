; DESCRIPTION: Places a orange 47x82 rectangle at position (100, 59).
; PLAN: r0=100(x), r1=59(y), r2=47(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 59
LDI r2, 47
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
