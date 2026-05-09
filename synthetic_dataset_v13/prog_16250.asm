; DESCRIPTION: Places a yellow 116x57 rectangle at position (163, 135).
; PLAN: r0=163(x), r1=135(y), r2=116(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 135
LDI r2, 116
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
