; DESCRIPTION: Places a yellow 81x64 rectangle at position (163, 78).
; PLAN: r0=163(x), r1=78(y), r2=81(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 78
LDI r2, 81
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
