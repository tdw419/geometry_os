; DESCRIPTION: Creates a red rectangular region at (320, 144) spanning 118 by 18 pixels.
; PLAN: r0=320(x), r1=144(y), r2=118(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 144
LDI r2, 118
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
