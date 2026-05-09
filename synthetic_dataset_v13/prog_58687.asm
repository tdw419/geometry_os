; DESCRIPTION: Places a blue 88x39 rectangle at position (380, 183).
; PLAN: r0=380(x), r1=183(y), r2=88(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 183
LDI r2, 88
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
