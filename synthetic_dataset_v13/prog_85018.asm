; DESCRIPTION: Creates a cyan rectangular region at (143, 98) spanning 73 by 79 pixels.
; PLAN: r0=143(x), r1=98(y), r2=73(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 98
LDI r2, 73
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
