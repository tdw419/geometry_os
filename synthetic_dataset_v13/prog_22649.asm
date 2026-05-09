; DESCRIPTION: Places a magenta 27x69 rectangle at position (115, 76).
; PLAN: r0=115(x), r1=76(y), r2=27(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 76
LDI r2, 27
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
