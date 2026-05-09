; DESCRIPTION: Places a magenta 61x47 rectangle at position (124, 203).
; PLAN: r0=124(x), r1=203(y), r2=61(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 203
LDI r2, 61
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
