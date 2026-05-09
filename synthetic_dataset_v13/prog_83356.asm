; DESCRIPTION: Places a black 39x17 rectangle at position (82, 172).
; PLAN: r0=82(x), r1=172(y), r2=39(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 172
LDI r2, 39
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
