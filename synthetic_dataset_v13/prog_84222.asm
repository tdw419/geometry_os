; DESCRIPTION: Creates a cyan rectangular region at (369, 199) spanning 115 by 15 pixels.
; PLAN: r0=369(x), r1=199(y), r2=115(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 199
LDI r2, 115
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
