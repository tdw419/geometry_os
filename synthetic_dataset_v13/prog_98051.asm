; DESCRIPTION: Places a magenta 83x58 rectangle at position (329, 128).
; PLAN: r0=329(x), r1=128(y), r2=83(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 128
LDI r2, 83
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
