; DESCRIPTION: Places a blue 108x46 rectangle at position (330, 199).
; PLAN: r0=330(x), r1=199(y), r2=108(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 199
LDI r2, 108
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
