; DESCRIPTION: Places a green 70x67 rectangle at position (150, 91).
; PLAN: r0=150(x), r1=91(y), r2=70(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 91
LDI r2, 70
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
