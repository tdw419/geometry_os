; DESCRIPTION: Places a yellow 86x43 rectangle at position (231, 70).
; PLAN: r0=231(x), r1=70(y), r2=86(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 70
LDI r2, 86
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
