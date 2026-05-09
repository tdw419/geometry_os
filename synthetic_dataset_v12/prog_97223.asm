; DESCRIPTION: Places a green 69x67 rectangle at position (63, 54).
; PLAN: r0=63(x), r1=54(y), r2=69(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 54
LDI r2, 69
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
