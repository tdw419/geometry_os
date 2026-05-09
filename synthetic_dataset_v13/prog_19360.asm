; DESCRIPTION: Renders a magenta box of size 69x111 starting at (202, 52).
; PLAN: r0=202(x), r1=52(y), r2=69(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 52
LDI r2, 69
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
