; DESCRIPTION: Places a black 72x73 rectangle at position (426, 153).
; PLAN: r0=426(x), r1=153(y), r2=72(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 153
LDI r2, 72
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
