; DESCRIPTION: Creates a purple rectangular region at (61, 65) spanning 67 by 71 pixels.
; PLAN: r0=61(x), r1=65(y), r2=67(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 65
LDI r2, 67
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
