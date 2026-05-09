; DESCRIPTION: Places a green 74x82 rectangle at position (161, 63).
; PLAN: r0=161(x), r1=63(y), r2=74(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 63
LDI r2, 74
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
