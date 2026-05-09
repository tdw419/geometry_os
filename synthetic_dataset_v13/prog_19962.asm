; DESCRIPTION: Creates a magenta rectangular region at (370, 151) spanning 99 by 94 pixels.
; PLAN: r0=370(x), r1=151(y), r2=99(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 151
LDI r2, 99
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
