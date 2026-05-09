; DESCRIPTION: Places a orange 76x103 rectangle at position (209, 92).
; PLAN: r0=209(x), r1=92(y), r2=76(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 92
LDI r2, 76
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
