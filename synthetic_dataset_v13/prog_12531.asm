; DESCRIPTION: Places a red 30x32 rectangle at position (49, 14).
; PLAN: r0=49(x), r1=14(y), r2=30(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 14
LDI r2, 30
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
