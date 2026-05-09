; DESCRIPTION: Places a blue 14x43 rectangle at position (295, 39).
; PLAN: r0=295(x), r1=39(y), r2=14(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 14
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
