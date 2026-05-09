; DESCRIPTION: Renders a magenta box of size 97x22 starting at (403, 61).
; PLAN: r0=403(x), r1=61(y), r2=97(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 61
LDI r2, 97
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
