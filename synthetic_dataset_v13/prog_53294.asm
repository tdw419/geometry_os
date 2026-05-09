; DESCRIPTION: Creates a cyan rectangular region at (361, 78) spanning 77 by 75 pixels.
; PLAN: r0=361(x), r1=78(y), r2=77(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 78
LDI r2, 77
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
