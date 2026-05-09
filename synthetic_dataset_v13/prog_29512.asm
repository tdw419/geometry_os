; DESCRIPTION: Creates a cyan rectangular region at (14, 125) spanning 58 by 75 pixels.
; PLAN: r0=14(x), r1=125(y), r2=58(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 125
LDI r2, 58
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
