; DESCRIPTION: Places a green 69x29 rectangle at position (127, 15).
; PLAN: r0=127(x), r1=15(y), r2=69(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 15
LDI r2, 69
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
