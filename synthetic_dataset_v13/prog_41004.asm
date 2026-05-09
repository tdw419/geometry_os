; DESCRIPTION: Places a green 70x11 rectangle at position (74, 198).
; PLAN: r0=74(x), r1=198(y), r2=70(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 198
LDI r2, 70
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
