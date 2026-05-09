; DESCRIPTION: Places a orange 99x71 rectangle at position (314, 166).
; PLAN: r0=314(x), r1=166(y), r2=99(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 166
LDI r2, 99
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
