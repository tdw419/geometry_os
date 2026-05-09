; DESCRIPTION: Places a green 115x39 rectangle at position (85, 203).
; PLAN: r0=85(x), r1=203(y), r2=115(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 203
LDI r2, 115
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
