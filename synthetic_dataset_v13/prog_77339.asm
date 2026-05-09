; DESCRIPTION: Creates a purple rectangular region at (249, 49) spanning 113 by 86 pixels.
; PLAN: r0=249(x), r1=49(y), r2=113(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 49
LDI r2, 113
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
