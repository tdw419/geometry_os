; DESCRIPTION: Creates a cyan rectangular region at (143, 77) spanning 73 by 36 pixels.
; PLAN: r0=143(x), r1=77(y), r2=73(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 77
LDI r2, 73
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
