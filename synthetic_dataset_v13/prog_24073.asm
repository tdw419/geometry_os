; DESCRIPTION: Creates a cyan rectangular region at (343, 51) spanning 69 by 85 pixels.
; PLAN: r0=343(x), r1=51(y), r2=69(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 51
LDI r2, 69
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
