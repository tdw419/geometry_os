; DESCRIPTION: Renders a magenta box of size 104x119 starting at (70, 13).
; PLAN: r0=70(x), r1=13(y), r2=104(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 13
LDI r2, 104
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
