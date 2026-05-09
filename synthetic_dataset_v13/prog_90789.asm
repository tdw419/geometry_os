; DESCRIPTION: Places a orange 35x36 rectangle at position (144, 198).
; PLAN: r0=144(x), r1=198(y), r2=35(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 198
LDI r2, 35
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
