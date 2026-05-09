; DESCRIPTION: Places a orange 65x38 rectangle at position (220, 69).
; PLAN: r0=220(x), r1=69(y), r2=65(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 69
LDI r2, 65
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
