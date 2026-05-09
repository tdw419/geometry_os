; DESCRIPTION: Places a black 62x39 rectangle at position (177, 98).
; PLAN: r0=177(x), r1=98(y), r2=62(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 98
LDI r2, 62
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
