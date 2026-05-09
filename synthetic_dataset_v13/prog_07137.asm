; DESCRIPTION: Creates a cyan rectangular region at (251, 1) spanning 92 by 77 pixels.
; PLAN: r0=251(x), r1=1(y), r2=92(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 1
LDI r2, 92
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
