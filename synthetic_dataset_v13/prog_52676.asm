; DESCRIPTION: Renders a blue box of size 65x36 starting at (42, 148).
; PLAN: r0=42(x), r1=148(y), r2=65(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 148
LDI r2, 65
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
