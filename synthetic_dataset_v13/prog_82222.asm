; DESCRIPTION: Renders a magenta box of size 50x79 starting at (438, 22).
; PLAN: r0=438(x), r1=22(y), r2=50(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 22
LDI r2, 50
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
