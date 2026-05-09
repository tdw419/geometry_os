; DESCRIPTION: Places a orange 90x59 rectangle at position (126, 102).
; PLAN: r0=126(x), r1=102(y), r2=90(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 102
LDI r2, 90
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
