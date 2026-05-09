; DESCRIPTION: Renders a blue box of size 42x106 starting at (305, 106).
; PLAN: r0=305(x), r1=106(y), r2=42(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 106
LDI r2, 42
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
