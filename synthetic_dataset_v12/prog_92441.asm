; DESCRIPTION: Places a green 62x69 rectangle at position (261, 46).
; PLAN: r0=261(x), r1=46(y), r2=62(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 46
LDI r2, 62
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
