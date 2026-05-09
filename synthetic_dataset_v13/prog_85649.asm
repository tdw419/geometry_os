; DESCRIPTION: Creates a magenta rectangular region at (327, 115) spanning 19 by 113 pixels.
; PLAN: r0=327(x), r1=115(y), r2=19(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 115
LDI r2, 19
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
