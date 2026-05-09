; DESCRIPTION: Creates a cyan rectangular region at (31, 104) spanning 56 by 51 pixels.
; PLAN: r0=31(x), r1=104(y), r2=56(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 104
LDI r2, 56
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
