; DESCRIPTION: Places a orange 19x21 rectangle at position (12, 223).
; PLAN: r0=12(x), r1=223(y), r2=19(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 223
LDI r2, 19
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
