; DESCRIPTION: Creates a magenta rectangular region at (333, 87) spanning 59 by 57 pixels.
; PLAN: r0=333(x), r1=87(y), r2=59(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 87
LDI r2, 59
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
