; DESCRIPTION: Renders a magenta box of size 97x68 starting at (395, 35).
; PLAN: r0=395(x), r1=35(y), r2=97(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 35
LDI r2, 97
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
