; DESCRIPTION: Creates a cyan rectangular region at (250, 96) spanning 19 by 45 pixels.
; PLAN: r0=250(x), r1=96(y), r2=19(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 96
LDI r2, 19
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
