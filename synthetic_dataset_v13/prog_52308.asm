; DESCRIPTION: Creates a magenta rectangular region at (349, 171) spanning 24 by 44 pixels.
; PLAN: r0=349(x), r1=171(y), r2=24(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 171
LDI r2, 24
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
