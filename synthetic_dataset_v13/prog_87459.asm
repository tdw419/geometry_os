; DESCRIPTION: Creates a magenta rectangular region at (426, 197) spanning 59 by 51 pixels.
; PLAN: r0=426(x), r1=197(y), r2=59(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 197
LDI r2, 59
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
