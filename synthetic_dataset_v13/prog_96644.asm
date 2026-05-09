; DESCRIPTION: Renders a magenta box of size 13x71 starting at (278, 8).
; PLAN: r0=278(x), r1=8(y), r2=13(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 8
LDI r2, 13
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
