; DESCRIPTION: Renders a magenta box of size 11x11 starting at (287, 223).
; PLAN: r0=287(x), r1=223(y), r2=11(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 223
LDI r2, 11
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
