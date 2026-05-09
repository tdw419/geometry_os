; DESCRIPTION: Places a blue 91x103 rectangle at position (53, 39).
; PLAN: r0=53(x), r1=39(y), r2=91(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 39
LDI r2, 91
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
