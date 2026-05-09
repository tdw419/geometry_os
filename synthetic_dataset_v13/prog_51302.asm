; DESCRIPTION: Creates a cyan rectangular region at (171, 15) spanning 68 by 100 pixels.
; PLAN: r0=171(x), r1=15(y), r2=68(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 15
LDI r2, 68
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
