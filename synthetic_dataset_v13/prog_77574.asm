; DESCRIPTION: Creates a cyan rectangular region at (73, 125) spanning 19 by 79 pixels.
; PLAN: r0=73(x), r1=125(y), r2=19(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 125
LDI r2, 19
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
