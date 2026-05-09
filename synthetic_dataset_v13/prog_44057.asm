; DESCRIPTION: Places a blue 97x57 rectangle at position (187, 121).
; PLAN: r0=187(x), r1=121(y), r2=97(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 121
LDI r2, 97
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
