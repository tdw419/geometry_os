; DESCRIPTION: Renders a magenta box of size 61x26 starting at (301, 11).
; PLAN: r0=301(x), r1=11(y), r2=61(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 11
LDI r2, 61
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
