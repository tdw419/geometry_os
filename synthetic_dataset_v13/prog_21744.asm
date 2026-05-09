; DESCRIPTION: Creates a cyan rectangular region at (104, 76) spanning 75 by 33 pixels.
; PLAN: r0=104(x), r1=76(y), r2=75(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 76
LDI r2, 75
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
