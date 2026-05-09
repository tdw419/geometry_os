; DESCRIPTION: Places a orange 14x88 rectangle at position (95, 46).
; PLAN: r0=95(x), r1=46(y), r2=14(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 46
LDI r2, 14
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
