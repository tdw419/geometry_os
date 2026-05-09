; DESCRIPTION: Creates a black rectangular region at (267, 52) spanning 92 by 32 pixels.
; PLAN: r0=267(x), r1=52(y), r2=92(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 52
LDI r2, 92
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
