; DESCRIPTION: Places a green 113x81 rectangle at position (157, 122).
; PLAN: r0=157(x), r1=122(y), r2=113(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 122
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
