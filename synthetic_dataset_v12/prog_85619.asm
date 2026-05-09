; DESCRIPTION: Places a blue 29x38 rectangle at position (230, 60).
; PLAN: r0=230(x), r1=60(y), r2=29(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 60
LDI r2, 29
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
