; DESCRIPTION: Creates a cyan rectangular region at (320, 118) spanning 106 by 79 pixels.
; PLAN: r0=320(x), r1=118(y), r2=106(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 118
LDI r2, 106
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
