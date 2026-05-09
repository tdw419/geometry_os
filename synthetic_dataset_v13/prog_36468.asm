; DESCRIPTION: Creates a cyan rectangular region at (126, 51) spanning 94 by 84 pixels.
; PLAN: r0=126(x), r1=51(y), r2=94(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 51
LDI r2, 94
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
