; DESCRIPTION: Creates a cyan rectangular region at (389, 15) spanning 72 by 38 pixels.
; PLAN: r0=389(x), r1=15(y), r2=72(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 15
LDI r2, 72
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
