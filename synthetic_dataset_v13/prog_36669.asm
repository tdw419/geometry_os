; DESCRIPTION: Creates a cyan rectangular region at (495, 163) spanning 14 by 75 pixels.
; PLAN: r0=495(x), r1=163(y), r2=14(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 163
LDI r2, 14
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
