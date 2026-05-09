; DESCRIPTION: Places a magenta 88x104 rectangle at position (309, 71).
; PLAN: r0=309(x), r1=71(y), r2=88(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 71
LDI r2, 88
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
