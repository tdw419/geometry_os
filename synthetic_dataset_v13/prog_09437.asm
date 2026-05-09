; DESCRIPTION: Places a black 74x46 rectangle at position (322, 62).
; PLAN: r0=322(x), r1=62(y), r2=74(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 62
LDI r2, 74
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
