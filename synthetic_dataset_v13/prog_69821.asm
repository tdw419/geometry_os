; DESCRIPTION: Renders a magenta box of size 31x88 starting at (304, 86).
; PLAN: r0=304(x), r1=86(y), r2=31(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 86
LDI r2, 31
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
