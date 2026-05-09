; DESCRIPTION: Creates a magenta rectangular region at (387, 91) spanning 77 by 18 pixels.
; PLAN: r0=387(x), r1=91(y), r2=77(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 91
LDI r2, 77
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
