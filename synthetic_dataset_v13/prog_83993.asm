; DESCRIPTION: Places a purple 108x47 rectangle at position (38, 65).
; PLAN: r0=38(x), r1=65(y), r2=108(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 65
LDI r2, 108
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
