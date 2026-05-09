; DESCRIPTION: Creates a purple rectangular region at (327, 34) spanning 75 by 79 pixels.
; PLAN: r0=327(x), r1=34(y), r2=75(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 34
LDI r2, 75
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
