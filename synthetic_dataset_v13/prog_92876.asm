; DESCRIPTION: Renders a magenta box of size 34x104 starting at (269, 23).
; PLAN: r0=269(x), r1=23(y), r2=34(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 23
LDI r2, 34
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
