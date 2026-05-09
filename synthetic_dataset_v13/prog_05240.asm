; DESCRIPTION: Creates a cyan rectangular region at (15, 136) spanning 73 by 70 pixels.
; PLAN: r0=15(x), r1=136(y), r2=73(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 136
LDI r2, 73
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
