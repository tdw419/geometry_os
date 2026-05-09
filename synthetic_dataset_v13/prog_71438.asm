; DESCRIPTION: Places a magenta 39x100 rectangle at position (138, 35).
; PLAN: r0=138(x), r1=35(y), r2=39(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 35
LDI r2, 39
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
