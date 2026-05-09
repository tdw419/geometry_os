; DESCRIPTION: Places a black 90x116 rectangle at position (86, 40).
; PLAN: r0=86(x), r1=40(y), r2=90(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 40
LDI r2, 90
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
