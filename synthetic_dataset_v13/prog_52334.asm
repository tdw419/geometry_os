; DESCRIPTION: Creates a red rectangular region at (135, 98) spanning 90 by 34 pixels.
; PLAN: r0=135(x), r1=98(y), r2=90(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 90
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
