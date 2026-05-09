; DESCRIPTION: Creates a cyan rectangular region at (366, 81) spanning 66 by 112 pixels.
; PLAN: r0=366(x), r1=81(y), r2=66(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 81
LDI r2, 66
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
