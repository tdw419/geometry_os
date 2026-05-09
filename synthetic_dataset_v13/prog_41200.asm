; DESCRIPTION: Creates a red rectangular region at (250, 208) spanning 78 by 16 pixels.
; PLAN: r0=250(x), r1=208(y), r2=78(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 208
LDI r2, 78
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
