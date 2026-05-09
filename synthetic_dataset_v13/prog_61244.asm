; DESCRIPTION: Creates a magenta rectangular region at (121, 220) spanning 18 by 12 pixels.
; PLAN: r0=121(x), r1=220(y), r2=18(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 220
LDI r2, 18
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
