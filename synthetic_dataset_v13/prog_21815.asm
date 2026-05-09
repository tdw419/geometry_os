; DESCRIPTION: Places a orange 26x17 rectangle at position (401, 14).
; PLAN: r0=401(x), r1=14(y), r2=26(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 14
LDI r2, 26
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
