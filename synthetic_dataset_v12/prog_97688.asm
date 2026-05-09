; DESCRIPTION: Places a magenta 11x116 rectangle at position (344, 11).
; PLAN: r0=344(x), r1=11(y), r2=11(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 11
LDI r2, 11
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
