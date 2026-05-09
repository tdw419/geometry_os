; DESCRIPTION: Creates a cyan rectangular region at (143, 23) spanning 112 by 73 pixels.
; PLAN: r0=143(x), r1=23(y), r2=112(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 23
LDI r2, 112
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
