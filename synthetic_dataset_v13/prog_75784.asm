; DESCRIPTION: Creates a red rectangular region at (144, 26) spanning 35 by 48 pixels.
; PLAN: r0=144(x), r1=26(y), r2=35(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 26
LDI r2, 35
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
