; DESCRIPTION: Places a red 79x97 rectangle at position (231, 122).
; PLAN: r0=231(x), r1=122(y), r2=79(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 122
LDI r2, 79
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
