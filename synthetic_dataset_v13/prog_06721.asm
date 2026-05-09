; DESCRIPTION: Renders a magenta box of size 15x59 starting at (476, 120).
; PLAN: r0=476(x), r1=120(y), r2=15(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 120
LDI r2, 15
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
