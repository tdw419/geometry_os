; DESCRIPTION: Renders a magenta box of size 104x110 starting at (44, 1).
; PLAN: r0=44(x), r1=1(y), r2=104(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 1
LDI r2, 104
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
