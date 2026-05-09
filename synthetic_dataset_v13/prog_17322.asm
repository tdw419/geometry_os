; DESCRIPTION: Places a purple 72x78 rectangle at position (82, 65).
; PLAN: r0=82(x), r1=65(y), r2=72(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 65
LDI r2, 72
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
