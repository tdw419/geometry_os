; DESCRIPTION: Places a red 72x117 rectangle at position (62, 128).
; PLAN: r0=62(x), r1=128(y), r2=72(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 128
LDI r2, 72
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
