; DESCRIPTION: Creates a cyan rectangular region at (84, 175) spanning 109 by 81 pixels.
; PLAN: r0=84(x), r1=175(y), r2=109(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 175
LDI r2, 109
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
