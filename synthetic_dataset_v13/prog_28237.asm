; DESCRIPTION: Renders a magenta box of size 29x86 starting at (390, 168).
; PLAN: r0=390(x), r1=168(y), r2=29(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 168
LDI r2, 29
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
