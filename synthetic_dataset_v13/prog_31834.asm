; DESCRIPTION: Creates a magenta rectangular region at (382, 25) spanning 61 by 59 pixels.
; PLAN: r0=382(x), r1=25(y), r2=61(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 25
LDI r2, 61
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
