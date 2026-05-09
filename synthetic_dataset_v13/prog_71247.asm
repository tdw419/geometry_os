; DESCRIPTION: Creates a magenta rectangular region at (160, 121) spanning 92 by 103 pixels.
; PLAN: r0=160(x), r1=121(y), r2=92(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 121
LDI r2, 92
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
