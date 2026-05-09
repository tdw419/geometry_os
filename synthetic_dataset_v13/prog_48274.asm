; DESCRIPTION: Places a magenta 59x90 rectangle at position (414, 96).
; PLAN: r0=414(x), r1=96(y), r2=59(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 96
LDI r2, 59
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
