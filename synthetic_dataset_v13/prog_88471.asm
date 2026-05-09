; DESCRIPTION: Creates a magenta rectangular region at (249, 109) spanning 52 by 65 pixels.
; PLAN: r0=249(x), r1=109(y), r2=52(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 109
LDI r2, 52
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
