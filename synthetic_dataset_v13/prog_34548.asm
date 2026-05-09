; DESCRIPTION: Creates a cyan rectangular region at (78, 134) spanning 87 by 92 pixels.
; PLAN: r0=78(x), r1=134(y), r2=87(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 134
LDI r2, 87
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
