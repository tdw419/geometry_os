; DESCRIPTION: Creates a cyan rectangular region at (98, 157) spanning 52 by 51 pixels.
; PLAN: r0=98(x), r1=157(y), r2=52(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 157
LDI r2, 52
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
