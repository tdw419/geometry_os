; DESCRIPTION: Places a blue 115x46 rectangle at position (258, 183).
; PLAN: r0=258(x), r1=183(y), r2=115(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 183
LDI r2, 115
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
