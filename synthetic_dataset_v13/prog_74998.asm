; DESCRIPTION: Creates a cyan rectangular region at (96, 52) spanning 51 by 82 pixels.
; PLAN: r0=96(x), r1=52(y), r2=51(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 52
LDI r2, 51
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
