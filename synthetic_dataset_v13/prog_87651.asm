; DESCRIPTION: Renders a blue box of size 42x86 starting at (106, 43).
; PLAN: r0=106(x), r1=43(y), r2=42(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 43
LDI r2, 42
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
