; DESCRIPTION: Places a magenta 108x23 rectangle at position (225, 43).
; PLAN: r0=225(x), r1=43(y), r2=108(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 43
LDI r2, 108
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
