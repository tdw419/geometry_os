; DESCRIPTION: Creates a cyan rectangular region at (416, 134) spanning 93 by 18 pixels.
; PLAN: r0=416(x), r1=134(y), r2=93(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 134
LDI r2, 93
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
