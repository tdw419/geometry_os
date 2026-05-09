; DESCRIPTION: Creates a cyan rectangular region at (220, 95) spanning 106 by 114 pixels.
; PLAN: r0=220(x), r1=95(y), r2=106(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 95
LDI r2, 106
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
