; DESCRIPTION: Places a blue 83x57 rectangle at position (309, 135).
; PLAN: r0=309(x), r1=135(y), r2=83(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 135
LDI r2, 83
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
