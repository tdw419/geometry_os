; DESCRIPTION: Creates a magenta rectangular region at (303, 125) spanning 13 by 14 pixels.
; PLAN: r0=303(x), r1=125(y), r2=13(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 125
LDI r2, 13
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
