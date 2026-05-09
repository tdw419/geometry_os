; DESCRIPTION: Places a magenta 119x71 rectangle at position (283, 59).
; PLAN: r0=283(x), r1=59(y), r2=119(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 59
LDI r2, 119
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
