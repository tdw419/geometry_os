; DESCRIPTION: Renders a purple box of size 104x101 starting at (116, 10).
; PLAN: r0=116(x), r1=10(y), r2=104(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 10
LDI r2, 104
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
