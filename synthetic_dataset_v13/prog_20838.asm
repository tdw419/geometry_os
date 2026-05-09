; DESCRIPTION: Places a green 19x50 rectangle at position (155, 134).
; PLAN: r0=155(x), r1=134(y), r2=19(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 134
LDI r2, 19
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
