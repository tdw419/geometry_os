; DESCRIPTION: Places a orange 102x43 rectangle at position (287, 33).
; PLAN: r0=287(x), r1=33(y), r2=102(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 33
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
