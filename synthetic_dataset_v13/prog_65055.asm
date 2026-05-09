; DESCRIPTION: Creates a purple rectangular region at (70, 32) spanning 117 by 92 pixels.
; PLAN: r0=70(x), r1=32(y), r2=117(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 32
LDI r2, 117
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
