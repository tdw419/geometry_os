; DESCRIPTION: Renders a magenta box of size 114x83 starting at (355, 168).
; PLAN: r0=355(x), r1=168(y), r2=114(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 168
LDI r2, 114
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
