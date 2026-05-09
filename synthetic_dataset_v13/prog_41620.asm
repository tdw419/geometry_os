; DESCRIPTION: Creates a cyan rectangular region at (315, 100) spanning 25 by 51 pixels.
; PLAN: r0=315(x), r1=100(y), r2=25(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 100
LDI r2, 25
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
