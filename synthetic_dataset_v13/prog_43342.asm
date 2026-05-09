; DESCRIPTION: Places a blue 98x107 rectangle at position (344, 56).
; PLAN: r0=344(x), r1=56(y), r2=98(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 56
LDI r2, 98
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
