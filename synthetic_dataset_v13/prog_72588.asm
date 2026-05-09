; DESCRIPTION: Renders a magenta box of size 117x71 starting at (240, 109).
; PLAN: r0=240(x), r1=109(y), r2=117(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 109
LDI r2, 117
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
