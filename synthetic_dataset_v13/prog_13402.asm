; DESCRIPTION: Places a purple 70x108 rectangle at position (91, 82).
; PLAN: r0=91(x), r1=82(y), r2=70(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 82
LDI r2, 70
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
