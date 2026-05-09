; DESCRIPTION: Creates a red rectangular region at (394, 84) spanning 90 by 106 pixels.
; PLAN: r0=394(x), r1=84(y), r2=90(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 84
LDI r2, 90
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
