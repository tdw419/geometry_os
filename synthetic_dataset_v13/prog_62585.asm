; DESCRIPTION: Places a green 45x44 rectangle at position (244, 151).
; PLAN: r0=244(x), r1=151(y), r2=45(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 151
LDI r2, 45
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
