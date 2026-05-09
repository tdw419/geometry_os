; DESCRIPTION: Places a red 114x116 rectangle at position (1, 132).
; PLAN: r0=1(x), r1=132(y), r2=114(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 132
LDI r2, 114
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
