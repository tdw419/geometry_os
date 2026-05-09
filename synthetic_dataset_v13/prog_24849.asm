; DESCRIPTION: Creates a cyan rectangular region at (132, 19) spanning 51 by 95 pixels.
; PLAN: r0=132(x), r1=19(y), r2=51(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 19
LDI r2, 51
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
