; DESCRIPTION: Places a black 90x108 rectangle at position (191, 24).
; PLAN: r0=191(x), r1=24(y), r2=90(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 24
LDI r2, 90
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
