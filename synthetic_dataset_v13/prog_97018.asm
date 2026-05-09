; DESCRIPTION: Places a green 105x88 rectangle at position (401, 121).
; PLAN: r0=401(x), r1=121(y), r2=105(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 121
LDI r2, 105
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
