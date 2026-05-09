; DESCRIPTION: Places a cyan 106x97 rectangle at position (183, 67).
; PLAN: r0=183(x), r1=67(y), r2=106(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 67
LDI r2, 106
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
