; DESCRIPTION: Renders a magenta box of size 99x28 starting at (249, 39).
; PLAN: r0=249(x), r1=39(y), r2=99(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 39
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
