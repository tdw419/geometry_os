; DESCRIPTION: Renders a magenta box of size 52x104 starting at (372, 79).
; PLAN: r0=372(x), r1=79(y), r2=52(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 79
LDI r2, 52
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
