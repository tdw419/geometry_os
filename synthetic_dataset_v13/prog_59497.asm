; DESCRIPTION: Creates a magenta rectangular region at (344, 25) spanning 60 by 109 pixels.
; PLAN: r0=344(x), r1=25(y), r2=60(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 25
LDI r2, 60
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
