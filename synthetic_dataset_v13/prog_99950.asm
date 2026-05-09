; DESCRIPTION: Creates a magenta rectangular region at (387, 38) spanning 34 by 109 pixels.
; PLAN: r0=387(x), r1=38(y), r2=34(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 38
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
