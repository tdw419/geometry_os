; DESCRIPTION: Renders a magenta box of size 27x36 starting at (473, 4).
; PLAN: r0=473(x), r1=4(y), r2=27(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 4
LDI r2, 27
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
