; DESCRIPTION: Places a blue 82x17 rectangle at position (336, 77).
; PLAN: r0=336(x), r1=77(y), r2=82(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 77
LDI r2, 82
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
