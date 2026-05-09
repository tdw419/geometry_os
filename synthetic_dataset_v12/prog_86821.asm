; DESCRIPTION: Renders a blue box of size 38x36 starting at (111, 95).
; PLAN: r0=111(x), r1=95(y), r2=38(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 95
LDI r2, 38
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
