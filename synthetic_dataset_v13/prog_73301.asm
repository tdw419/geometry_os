; DESCRIPTION: Creates a cyan rectangular region at (125, 121) spanning 79 by 56 pixels.
; PLAN: r0=125(x), r1=121(y), r2=79(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 121
LDI r2, 79
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
