; DESCRIPTION: Creates a cyan rectangular region at (328, 15) spanning 66 by 76 pixels.
; PLAN: r0=328(x), r1=15(y), r2=66(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 15
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
