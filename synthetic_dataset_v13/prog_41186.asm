; DESCRIPTION: Creates a red rectangular region at (90, 162) spanning 14 by 90 pixels.
; PLAN: r0=90(x), r1=162(y), r2=14(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 162
LDI r2, 14
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
