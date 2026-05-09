; DESCRIPTION: Places a green 58x34 rectangle at position (14, 40).
; PLAN: r0=14(x), r1=40(y), r2=58(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 40
LDI r2, 58
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
