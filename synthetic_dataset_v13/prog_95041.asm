; DESCRIPTION: Places a blue 43x43 rectangle at position (186, 2).
; PLAN: r0=186(x), r1=2(y), r2=43(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 2
LDI r2, 43
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
