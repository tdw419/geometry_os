; DESCRIPTION: Creates a cyan rectangular region at (125, 1) spanning 81 by 70 pixels.
; PLAN: r0=125(x), r1=1(y), r2=81(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 1
LDI r2, 81
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
