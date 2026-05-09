; DESCRIPTION: Places a orange 78x12 rectangle at position (59, 102).
; PLAN: r0=59(x), r1=102(y), r2=78(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 102
LDI r2, 78
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
