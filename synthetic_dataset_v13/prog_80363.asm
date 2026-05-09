; DESCRIPTION: Creates a blue rectangular region at (267, 67) spanning 117 by 96 pixels.
; PLAN: r0=267(x), r1=67(y), r2=117(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 67
LDI r2, 117
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
