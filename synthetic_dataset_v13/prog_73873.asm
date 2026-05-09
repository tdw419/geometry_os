; DESCRIPTION: Places a red 102x88 rectangle at position (239, 2).
; PLAN: r0=239(x), r1=2(y), r2=102(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 2
LDI r2, 102
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
