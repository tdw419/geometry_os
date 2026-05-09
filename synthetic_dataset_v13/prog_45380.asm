; DESCRIPTION: Creates a cyan rectangular region at (444, 77) spanning 39 by 105 pixels.
; PLAN: r0=444(x), r1=77(y), r2=39(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 77
LDI r2, 39
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
