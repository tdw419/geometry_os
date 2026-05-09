; DESCRIPTION: Creates a cyan rectangular region at (202, 172) spanning 36 by 78 pixels.
; PLAN: r0=202(x), r1=172(y), r2=36(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 172
LDI r2, 36
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
