; DESCRIPTION: Creates a cyan rectangular region at (312, 181) spanning 19 by 57 pixels.
; PLAN: r0=312(x), r1=181(y), r2=19(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 181
LDI r2, 19
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
