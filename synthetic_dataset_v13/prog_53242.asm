; DESCRIPTION: Places a white 88x36 rectangle at position (307, 212).
; PLAN: r0=307(x), r1=212(y), r2=88(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 212
LDI r2, 88
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
