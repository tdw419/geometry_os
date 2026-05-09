; DESCRIPTION: Places a green 85x67 rectangle at position (175, 15).
; PLAN: r0=175(x), r1=15(y), r2=85(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 15
LDI r2, 85
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
