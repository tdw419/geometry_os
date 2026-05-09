; DESCRIPTION: Renders a magenta box of size 13x75 starting at (104, 67).
; PLAN: r0=104(x), r1=67(y), r2=13(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 67
LDI r2, 13
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
