; DESCRIPTION: Places a magenta 78x92 rectangle at position (135, 65).
; PLAN: r0=135(x), r1=65(y), r2=78(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
