; DESCRIPTION: Places a red 16x76 rectangle at position (15, 128).
; PLAN: r0=15(x), r1=128(y), r2=16(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 128
LDI r2, 16
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
