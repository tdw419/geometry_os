; DESCRIPTION: Creates a cyan rectangular region at (7, 37) spanning 15 by 72 pixels.
; PLAN: r0=7(x), r1=37(y), r2=15(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 37
LDI r2, 15
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
