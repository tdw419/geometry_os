; DESCRIPTION: Renders a magenta box of size 104x114 starting at (394, 87).
; PLAN: r0=394(x), r1=87(y), r2=104(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 87
LDI r2, 104
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
