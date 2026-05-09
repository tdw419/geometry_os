; DESCRIPTION: Creates a cyan rectangular region at (182, 45) spanning 51 by 117 pixels.
; PLAN: r0=182(x), r1=45(y), r2=51(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 45
LDI r2, 51
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
