; DESCRIPTION: Places a orange 92x68 rectangle at position (43, 76).
; PLAN: r0=43(x), r1=76(y), r2=92(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 76
LDI r2, 92
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
