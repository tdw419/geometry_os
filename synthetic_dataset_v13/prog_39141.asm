; DESCRIPTION: Creates a magenta rectangular region at (71, 79) spanning 86 by 38 pixels.
; PLAN: r0=71(x), r1=79(y), r2=86(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 79
LDI r2, 86
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
