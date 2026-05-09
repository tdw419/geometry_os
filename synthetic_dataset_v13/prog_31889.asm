; DESCRIPTION: Places a green 35x82 rectangle at position (207, 53).
; PLAN: r0=207(x), r1=53(y), r2=35(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 53
LDI r2, 35
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
