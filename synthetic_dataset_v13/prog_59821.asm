; DESCRIPTION: Creates a red rectangular region at (72, 106) spanning 90 by 68 pixels.
; PLAN: r0=72(x), r1=106(y), r2=90(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 106
LDI r2, 90
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
