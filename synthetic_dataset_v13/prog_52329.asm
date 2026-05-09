; DESCRIPTION: Places a orange 61x52 rectangle at position (69, 148).
; PLAN: r0=69(x), r1=148(y), r2=61(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 148
LDI r2, 61
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
