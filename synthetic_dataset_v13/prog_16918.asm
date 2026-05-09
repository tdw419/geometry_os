; DESCRIPTION: Places a red 49x22 rectangle at position (34, 16).
; PLAN: r0=34(x), r1=16(y), r2=49(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 16
LDI r2, 49
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
