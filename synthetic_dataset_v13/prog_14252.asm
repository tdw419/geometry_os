; DESCRIPTION: Places a magenta 34x92 rectangle at position (59, 96).
; PLAN: r0=59(x), r1=96(y), r2=34(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 96
LDI r2, 34
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
