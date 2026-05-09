; DESCRIPTION: Renders a magenta box of size 10x15 starting at (413, 104).
; PLAN: r0=413(x), r1=104(y), r2=10(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 104
LDI r2, 10
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
