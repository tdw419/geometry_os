; DESCRIPTION: Places a blue 96x25 rectangle at position (49, 186).
; PLAN: r0=49(x), r1=186(y), r2=96(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 186
LDI r2, 96
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
