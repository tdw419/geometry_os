; DESCRIPTION: Renders a magenta box of size 16x92 starting at (359, 35).
; PLAN: r0=359(x), r1=35(y), r2=16(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 35
LDI r2, 16
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
