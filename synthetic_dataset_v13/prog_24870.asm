; DESCRIPTION: Places a orange 27x108 rectangle at position (183, 148).
; PLAN: r0=183(x), r1=148(y), r2=27(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 148
LDI r2, 27
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
