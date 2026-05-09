; DESCRIPTION: Renders a blue box of size 42x102 starting at (113, 12).
; PLAN: r0=113(x), r1=12(y), r2=42(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 12
LDI r2, 42
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
