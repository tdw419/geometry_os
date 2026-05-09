; DESCRIPTION: Creates a green rectangular region at (267, 82) spanning 119 by 39 pixels.
; PLAN: r0=267(x), r1=82(y), r2=119(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 82
LDI r2, 119
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
