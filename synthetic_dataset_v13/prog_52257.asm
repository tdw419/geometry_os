; DESCRIPTION: Places a blue 29x97 rectangle at position (175, 82).
; PLAN: r0=175(x), r1=82(y), r2=29(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 82
LDI r2, 29
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
