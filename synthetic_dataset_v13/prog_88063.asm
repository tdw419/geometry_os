; DESCRIPTION: Places a magenta 81x11 rectangle at position (76, 174).
; PLAN: r0=76(x), r1=174(y), r2=81(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 174
LDI r2, 81
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
