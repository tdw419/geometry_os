; DESCRIPTION: Creates a magenta rectangular region at (286, 61) spanning 30 by 59 pixels.
; PLAN: r0=286(x), r1=61(y), r2=30(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 61
LDI r2, 30
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
