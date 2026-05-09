; DESCRIPTION: Creates a magenta rectangular region at (387, 146) spanning 23 by 77 pixels.
; PLAN: r0=387(x), r1=146(y), r2=23(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 146
LDI r2, 23
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
