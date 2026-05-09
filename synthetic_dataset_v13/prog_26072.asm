; DESCRIPTION: Places a magenta 110x19 rectangle at position (0, 14).
; PLAN: r0=0(x), r1=14(y), r2=110(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 14
LDI r2, 110
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
