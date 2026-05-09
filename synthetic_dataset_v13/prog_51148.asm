; DESCRIPTION: Creates a red rectangular region at (267, 39) spanning 73 by 48 pixels.
; PLAN: r0=267(x), r1=39(y), r2=73(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 39
LDI r2, 73
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
