; DESCRIPTION: Places a cyan 67x93 rectangle at position (188, 54).
; PLAN: r0=188(x), r1=54(y), r2=67(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 54
LDI r2, 67
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
