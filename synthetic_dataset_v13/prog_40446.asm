; DESCRIPTION: Places a green 53x18 rectangle at position (29, 60).
; PLAN: r0=29(x), r1=60(y), r2=53(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 60
LDI r2, 53
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
