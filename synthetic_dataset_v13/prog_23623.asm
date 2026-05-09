; DESCRIPTION: Places a red 86x115 rectangle at position (57, 67).
; PLAN: r0=57(x), r1=67(y), r2=86(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 67
LDI r2, 86
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
