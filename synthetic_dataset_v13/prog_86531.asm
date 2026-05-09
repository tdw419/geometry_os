; DESCRIPTION: Places a green 58x39 rectangle at position (64, 136).
; PLAN: r0=64(x), r1=136(y), r2=58(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 136
LDI r2, 58
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
