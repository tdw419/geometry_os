; DESCRIPTION: Creates a magenta rectangular region at (196, 142) spanning 38 by 103 pixels.
; PLAN: r0=196(x), r1=142(y), r2=38(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 142
LDI r2, 38
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
