; DESCRIPTION: Creates a magenta rectangular region at (344, 20) spanning 86 by 117 pixels.
; PLAN: r0=344(x), r1=20(y), r2=86(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 20
LDI r2, 86
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
