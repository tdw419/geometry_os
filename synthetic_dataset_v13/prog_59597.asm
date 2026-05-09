; DESCRIPTION: Renders a magenta box of size 40x36 starting at (368, 29).
; PLAN: r0=368(x), r1=29(y), r2=40(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 29
LDI r2, 40
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
