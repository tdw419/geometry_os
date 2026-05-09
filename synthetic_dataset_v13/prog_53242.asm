; DESCRIPTION: Creates a cyan rectangular region at (51, 142) spanning 60 by 97 pixels.
; PLAN: r0=51(x), r1=142(y), r2=60(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 142
LDI r2, 60
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
