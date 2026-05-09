; DESCRIPTION: Creates a red rectangular region at (267, 6) spanning 19 by 90 pixels.
; PLAN: r0=267(x), r1=6(y), r2=19(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 6
LDI r2, 19
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
