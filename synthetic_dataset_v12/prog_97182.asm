; DESCRIPTION: Places a red 35x116 rectangle at position (44, 62).
; PLAN: r0=44(x), r1=62(y), r2=35(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 62
LDI r2, 35
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
