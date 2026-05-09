; DESCRIPTION: Places a green 97x55 rectangle at position (222, 198).
; PLAN: r0=222(x), r1=198(y), r2=97(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 198
LDI r2, 97
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
