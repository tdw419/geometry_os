; DESCRIPTION: Renders a magenta box of size 91x97 starting at (352, 73).
; PLAN: r0=352(x), r1=73(y), r2=91(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 91
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
