; DESCRIPTION: Creates a cyan rectangular region at (70, 88) spanning 49 by 55 pixels.
; PLAN: r0=70(x), r1=88(y), r2=49(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 88
LDI r2, 49
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
