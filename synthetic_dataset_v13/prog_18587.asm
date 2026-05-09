; DESCRIPTION: Creates a purple rectangular region at (228, 88) spanning 75 by 113 pixels.
; PLAN: r0=228(x), r1=88(y), r2=75(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 88
LDI r2, 75
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
