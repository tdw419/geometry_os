; DESCRIPTION: Renders a magenta box of size 84x104 starting at (347, 10).
; PLAN: r0=347(x), r1=10(y), r2=84(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 10
LDI r2, 84
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
