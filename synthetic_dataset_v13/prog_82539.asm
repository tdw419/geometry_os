; DESCRIPTION: Creates a magenta rectangular region at (243, 166) spanning 57 by 61 pixels.
; PLAN: r0=243(x), r1=166(y), r2=57(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 166
LDI r2, 57
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
