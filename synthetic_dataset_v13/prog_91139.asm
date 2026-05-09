; DESCRIPTION: Creates a magenta rectangular region at (387, 116) spanning 50 by 111 pixels.
; PLAN: r0=387(x), r1=116(y), r2=50(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 116
LDI r2, 50
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
