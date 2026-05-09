; DESCRIPTION: Places a green 108x39 rectangle at position (58, 22).
; PLAN: r0=58(x), r1=22(y), r2=108(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 22
LDI r2, 108
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
