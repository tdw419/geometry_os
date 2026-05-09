; DESCRIPTION: Places a blue 19x69 rectangle at position (328, 186).
; PLAN: r0=328(x), r1=186(y), r2=19(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 186
LDI r2, 19
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
