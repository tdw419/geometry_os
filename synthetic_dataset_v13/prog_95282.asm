; DESCRIPTION: Places a orange 55x30 rectangle at position (46, 88).
; PLAN: r0=46(x), r1=88(y), r2=55(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 88
LDI r2, 55
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
