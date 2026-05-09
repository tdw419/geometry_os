; DESCRIPTION: Creates a cyan rectangular region at (8, 77) spanning 54 by 19 pixels.
; PLAN: r0=8(x), r1=77(y), r2=54(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 77
LDI r2, 54
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
