; DESCRIPTION: Places a green 73x11 rectangle at position (163, 128).
; PLAN: r0=163(x), r1=128(y), r2=73(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 128
LDI r2, 73
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
