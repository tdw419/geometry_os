; DESCRIPTION: Renders a magenta box of size 16x30 starting at (351, 181).
; PLAN: r0=351(x), r1=181(y), r2=16(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 181
LDI r2, 16
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
