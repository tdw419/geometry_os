; DESCRIPTION: Places a cyan 115x57 rectangle at position (171, 67).
; PLAN: r0=171(x), r1=67(y), r2=115(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 67
LDI r2, 115
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
