; DESCRIPTION: Places a black 39x39 rectangle at position (119, 134).
; PLAN: r0=119(x), r1=134(y), r2=39(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 134
LDI r2, 39
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
