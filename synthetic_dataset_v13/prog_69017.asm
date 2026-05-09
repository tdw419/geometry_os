; DESCRIPTION: Creates a cyan rectangular region at (95, 105) spanning 91 by 106 pixels.
; PLAN: r0=95(x), r1=105(y), r2=91(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 105
LDI r2, 91
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
