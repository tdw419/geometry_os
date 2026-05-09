; DESCRIPTION: Creates a blue rectangular region at (267, 121) spanning 65 by 28 pixels.
; PLAN: r0=267(x), r1=121(y), r2=65(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 121
LDI r2, 65
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
