; DESCRIPTION: Creates a black rectangular region at (267, 16) spanning 100 by 85 pixels.
; PLAN: r0=267(x), r1=16(y), r2=100(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 16
LDI r2, 100
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
