; DESCRIPTION: Creates a magenta rectangular region at (387, 31) spanning 26 by 70 pixels.
; PLAN: r0=387(x), r1=31(y), r2=26(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 31
LDI r2, 26
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
