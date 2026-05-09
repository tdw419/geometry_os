; DESCRIPTION: Places a blue 17x49 rectangle at position (306, 203).
; PLAN: r0=306(x), r1=203(y), r2=17(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 203
LDI r2, 17
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
