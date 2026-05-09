; DESCRIPTION: Renders a magenta box of size 52x38 starting at (188, 216).
; PLAN: r0=188(x), r1=216(y), r2=52(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 216
LDI r2, 52
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
