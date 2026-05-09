; DESCRIPTION: Renders a magenta box of size 27x114 starting at (48, 74).
; PLAN: r0=48(x), r1=74(y), r2=27(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 74
LDI r2, 27
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
