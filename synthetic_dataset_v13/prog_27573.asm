; DESCRIPTION: Creates a cyan rectangular region at (125, 72) spanning 38 by 57 pixels.
; PLAN: r0=125(x), r1=72(y), r2=38(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 72
LDI r2, 38
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
