; DESCRIPTION: Places a red 64x67 rectangle at position (17, 77).
; PLAN: r0=17(x), r1=77(y), r2=64(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 77
LDI r2, 64
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
