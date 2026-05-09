; DESCRIPTION: Places a red 64x20 rectangle at position (11, 227).
; PLAN: r0=11(x), r1=227(y), r2=64(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 227
LDI r2, 64
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
