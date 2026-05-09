; DESCRIPTION: Creates a red rectangular region at (297, 162) spanning 108 by 90 pixels.
; PLAN: r0=297(x), r1=162(y), r2=108(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 162
LDI r2, 108
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
