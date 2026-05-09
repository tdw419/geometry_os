; DESCRIPTION: Places a green 67x70 rectangle at position (384, 166).
; PLAN: r0=384(x), r1=166(y), r2=67(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 166
LDI r2, 67
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
