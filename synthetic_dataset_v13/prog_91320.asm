; DESCRIPTION: Places a black 81x116 rectangle at position (398, 129).
; PLAN: r0=398(x), r1=129(y), r2=81(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 129
LDI r2, 81
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
