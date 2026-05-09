; DESCRIPTION: Places a orange 34x88 rectangle at position (302, 165).
; PLAN: r0=302(x), r1=165(y), r2=34(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 165
LDI r2, 34
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
