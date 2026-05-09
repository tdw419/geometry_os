; DESCRIPTION: Renders a magenta box of size 104x72 starting at (407, 162).
; PLAN: r0=407(x), r1=162(y), r2=104(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 162
LDI r2, 104
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
