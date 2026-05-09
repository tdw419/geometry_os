; DESCRIPTION: Creates a cyan rectangular region at (209, 89) spanning 92 by 110 pixels.
; PLAN: r0=209(x), r1=89(y), r2=92(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 89
LDI r2, 92
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
