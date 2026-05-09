; DESCRIPTION: Places a green 69x49 rectangle at position (19, 164).
; PLAN: r0=19(x), r1=164(y), r2=69(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 164
LDI r2, 69
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
