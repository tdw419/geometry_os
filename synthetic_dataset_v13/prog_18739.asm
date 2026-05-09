; DESCRIPTION: Places a cyan 67x60 rectangle at position (183, 168).
; PLAN: r0=183(x), r1=168(y), r2=67(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 168
LDI r2, 67
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
