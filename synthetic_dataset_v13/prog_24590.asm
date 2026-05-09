; DESCRIPTION: Places a orange 46x49 rectangle at position (22, 157).
; PLAN: r0=22(x), r1=157(y), r2=46(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 157
LDI r2, 46
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
