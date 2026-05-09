; DESCRIPTION: Creates a cyan rectangular region at (137, 104) spanning 51 by 80 pixels.
; PLAN: r0=137(x), r1=104(y), r2=51(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 104
LDI r2, 51
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
