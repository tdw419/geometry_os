; DESCRIPTION: Creates a cyan rectangular region at (337, 175) spanning 93 by 54 pixels.
; PLAN: r0=337(x), r1=175(y), r2=93(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 175
LDI r2, 93
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
