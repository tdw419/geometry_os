; DESCRIPTION: Places a black 116x19 rectangle at position (310, 169).
; PLAN: r0=310(x), r1=169(y), r2=116(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 169
LDI r2, 116
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
