; DESCRIPTION: Places a blue 92x105 rectangle at position (122, 82).
; PLAN: r0=122(x), r1=82(y), r2=92(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 82
LDI r2, 92
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
