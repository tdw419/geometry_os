; DESCRIPTION: Places a blue 108x65 rectangle at position (226, 183).
; PLAN: r0=226(x), r1=183(y), r2=108(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 183
LDI r2, 108
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
