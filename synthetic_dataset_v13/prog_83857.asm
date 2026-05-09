; DESCRIPTION: Creates a cyan rectangular region at (174, 121) spanning 110 by 92 pixels.
; PLAN: r0=174(x), r1=121(y), r2=110(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 121
LDI r2, 110
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
