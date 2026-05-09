; DESCRIPTION: Creates a purple rectangular region at (164, 94) spanning 79 by 61 pixels.
; PLAN: r0=164(x), r1=94(y), r2=79(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 94
LDI r2, 79
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
