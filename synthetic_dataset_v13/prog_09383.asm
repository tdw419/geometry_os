; DESCRIPTION: Places a green 53x49 rectangle at position (219, 202).
; PLAN: r0=219(x), r1=202(y), r2=53(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 202
LDI r2, 53
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
