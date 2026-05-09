; DESCRIPTION: Places a green 43x67 rectangle at position (58, 89).
; PLAN: r0=58(x), r1=89(y), r2=43(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 89
LDI r2, 43
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
