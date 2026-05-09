; DESCRIPTION: Creates a cyan rectangular region at (175, 125) spanning 69 by 115 pixels.
; PLAN: r0=175(x), r1=125(y), r2=69(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 125
LDI r2, 69
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
