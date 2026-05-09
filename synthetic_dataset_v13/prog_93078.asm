; DESCRIPTION: Places a orange 18x17 rectangle at position (339, 59).
; PLAN: r0=339(x), r1=59(y), r2=18(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 59
LDI r2, 18
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
