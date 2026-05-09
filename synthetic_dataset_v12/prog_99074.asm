; DESCRIPTION: Places a blue 71x67 rectangle at position (391, 63).
; PLAN: r0=391(x), r1=63(y), r2=71(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 63
LDI r2, 71
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
