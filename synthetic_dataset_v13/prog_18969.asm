; DESCRIPTION: Places a blue 112x17 rectangle at position (21, 82).
; PLAN: r0=21(x), r1=82(y), r2=112(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 82
LDI r2, 112
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
