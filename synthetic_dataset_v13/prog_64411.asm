; DESCRIPTION: Renders a magenta box of size 11x16 starting at (157, 98).
; PLAN: r0=157(x), r1=98(y), r2=11(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 98
LDI r2, 11
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
