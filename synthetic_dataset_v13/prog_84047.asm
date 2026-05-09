; DESCRIPTION: Renders a purple box of size 42x34 starting at (136, 44).
; PLAN: r0=136(x), r1=44(y), r2=42(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 44
LDI r2, 42
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
