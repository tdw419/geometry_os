; DESCRIPTION: Creates a magenta rectangular region at (61, 71) spanning 27 by 34 pixels.
; PLAN: r0=61(x), r1=71(y), r2=27(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 71
LDI r2, 27
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
