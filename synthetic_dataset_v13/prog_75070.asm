; DESCRIPTION: Creates a magenta rectangular region at (72, 58) spanning 115 by 120 pixels.
; PLAN: r0=72(x), r1=58(y), r2=115(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 58
LDI r2, 115
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
