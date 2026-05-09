; DESCRIPTION: Places a orange 70x36 rectangle at position (245, 10).
; PLAN: r0=245(x), r1=10(y), r2=70(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 10
LDI r2, 70
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
