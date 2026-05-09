; DESCRIPTION: Renders a magenta box of size 34x79 starting at (335, 104).
; PLAN: r0=335(x), r1=104(y), r2=34(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 104
LDI r2, 34
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
