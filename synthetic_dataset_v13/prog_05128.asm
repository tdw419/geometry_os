; DESCRIPTION: Places a purple 69x26 rectangle at position (353, 213).
; PLAN: r0=353(x), r1=213(y), r2=69(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 213
LDI r2, 69
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
