; DESCRIPTION: Creates a magenta rectangular region at (65, 151) spanning 70 by 40 pixels.
; PLAN: r0=65(x), r1=151(y), r2=70(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 151
LDI r2, 70
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
