; DESCRIPTION: Places a magenta 48x57 rectangle at position (124, 122).
; PLAN: r0=124(x), r1=122(y), r2=48(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 122
LDI r2, 48
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
