; DESCRIPTION: Creates a cyan rectangular region at (30, 26) spanning 79 by 99 pixels.
; PLAN: r0=30(x), r1=26(y), r2=79(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 26
LDI r2, 79
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
