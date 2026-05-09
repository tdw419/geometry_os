; DESCRIPTION: Places a cyan 67x106 rectangle at position (410, 106).
; PLAN: r0=410(x), r1=106(y), r2=67(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 106
LDI r2, 67
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
