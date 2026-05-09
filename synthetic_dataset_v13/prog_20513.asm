; DESCRIPTION: Creates a purple rectangular region at (344, 154) spanning 113 by 23 pixels.
; PLAN: r0=344(x), r1=154(y), r2=113(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 154
LDI r2, 113
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
