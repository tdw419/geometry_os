; DESCRIPTION: Places a magenta 32x81 rectangle at position (332, 7).
; PLAN: r0=332(x), r1=7(y), r2=32(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 7
LDI r2, 32
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
