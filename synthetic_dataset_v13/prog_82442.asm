; DESCRIPTION: Places a red 49x10 rectangle at position (184, 55).
; PLAN: r0=184(x), r1=55(y), r2=49(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 55
LDI r2, 49
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
