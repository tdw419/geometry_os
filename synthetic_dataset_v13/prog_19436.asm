; DESCRIPTION: Places a magenta 81x20 rectangle at position (305, 181).
; PLAN: r0=305(x), r1=181(y), r2=81(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 181
LDI r2, 81
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
