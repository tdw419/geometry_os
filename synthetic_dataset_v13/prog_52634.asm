; DESCRIPTION: Renders a magenta box of size 80x65 starting at (334, 170).
; PLAN: r0=334(x), r1=170(y), r2=80(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 170
LDI r2, 80
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
