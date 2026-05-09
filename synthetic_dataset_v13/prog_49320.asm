; DESCRIPTION: Renders a blue box of size 38x43 starting at (63, 27).
; PLAN: r0=63(x), r1=27(y), r2=38(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 27
LDI r2, 38
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
