; DESCRIPTION: Creates a purple rectangular region at (267, 218) spanning 41 by 16 pixels.
; PLAN: r0=267(x), r1=218(y), r2=41(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 218
LDI r2, 41
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
