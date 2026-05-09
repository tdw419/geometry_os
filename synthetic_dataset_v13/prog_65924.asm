; DESCRIPTION: Creates a magenta rectangular region at (344, 84) spanning 98 by 84 pixels.
; PLAN: r0=344(x), r1=84(y), r2=98(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 84
LDI r2, 98
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
