; DESCRIPTION: Places a blue 53x17 rectangle at position (194, 225).
; PLAN: r0=194(x), r1=225(y), r2=53(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 225
LDI r2, 53
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
