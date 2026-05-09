; DESCRIPTION: Places a purple 71x69 rectangle at position (241, 108).
; PLAN: r0=241(x), r1=108(y), r2=71(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 108
LDI r2, 71
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
