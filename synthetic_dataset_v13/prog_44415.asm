; DESCRIPTION: Creates a cyan rectangular region at (367, 165) spanning 106 by 20 pixels.
; PLAN: r0=367(x), r1=165(y), r2=106(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 165
LDI r2, 106
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
