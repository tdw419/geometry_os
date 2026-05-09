; DESCRIPTION: Creates a cyan rectangular region at (456, 105) spanning 24 by 112 pixels.
; PLAN: r0=456(x), r1=105(y), r2=24(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 105
LDI r2, 24
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
