; DESCRIPTION: Renders a blue box of size 42x17 starting at (323, 44).
; PLAN: r0=323(x), r1=44(y), r2=42(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 44
LDI r2, 42
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
