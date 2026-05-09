; DESCRIPTION: Creates a magenta rectangular region at (44, 84) spanning 59 by 71 pixels.
; PLAN: r0=44(x), r1=84(y), r2=59(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 84
LDI r2, 59
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
